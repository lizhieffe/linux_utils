#include "shared_lib.h"

#include <chrono>
#include <fstream>
#include <iostream>
#include <fcntl.h>
#include <unistd.h>
#include <fstream>
#include <iostream>
#include <memory>
#include <string>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>

using ::std::string;

static std::string SAMPLE_FILE = "sample_file.txt";
static std::string RESULT_FILE = "result.txt";

static void InitAnotherString() {
  std::unique_ptr<string> s = std::make_unique<string>("abcd");
}

void InitString() {
  std::unique_ptr<string> s = std::make_unique<string>("abcd");
  InitAnotherString();
}

void ReadSampleFile() {
  std::ifstream is;
  is.open(SAMPLE_FILE);

  if (is) {
    // get length of file:
    is.seekg (0, is.end);
    int length = is.tellg();
    is.seekg (0, is.beg);

    char * buffer = new char [length];

    std::cout << "Reading " << length << " characters... " << std::endl;
    // read data as a block:
    is.read (buffer,length);

    if (is)
      std::cout << "all characters read successfully." << std::endl;
    else
      std::cout << "error: only " << is.gcount() << " could be read" << std::endl;
    is.close();

    // ...buffer contains the entire file...

    delete[] buffer;
  }

  is.close();
}

void MmapSampleFile() {
  int fd = ::open(SAMPLE_FILE.c_str(), O_RDONLY);
  if (fd < 0) {
    std::cerr << "Error opening " << SAMPLE_FILE << std::endl;
    exit(1);
  }
  std::ofstream ofs(RESULT_FILE, std::ios_base::binary);
  if (!ofs) {
    std::cerr << "Error opening " << RESULT_FILE << std::endl;
    exit(1);
  }

  auto file_size = lseek(fd, 0, SEEK_END);

  lseek(fd, 0, SEEK_SET);
  unsigned long long res = 0;
  auto begin = std::chrono::system_clock::now();

  char *chunk = reinterpret_cast<char*>(mmap(NULL, file_size, PROT_READ, MAP_FILE | MAP_SHARED, fd, 0));
  char *addr = chunk;

  for (size_t j = 0; j < file_size; j++) {
      res += *chunk++;
  }
  ofs << res;

  munmap(addr, file_size);
  ::close(fd);
}
