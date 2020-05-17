#include "shared_lib.h"

#include <fstream>
#include <iostream>
#include <memory>
#include <string>

using ::std::string;

static void InitAnotherString() {
  std::unique_ptr<string> s = std::make_unique<string>("abcd");
}

void InitString() {
  std::unique_ptr<string> s = std::make_unique<string>("abcd");
  InitAnotherString();
}

void ReadSampleFile() {
  std::ifstream is;
  is.open("sample_file.txt");

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
