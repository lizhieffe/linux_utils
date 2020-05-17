// This is a test cc file for perf

#include <iostream>
#include <memory>
#include <string>

#include "shared_lib.h"

using ::std::cout;
using ::std::endl;
using ::std::string;

int main() {
  std::cout << "Please start 'perf' in another window and Enter to continue...";
  std::cin.get();

  while (true) {
    InitString();
    ReadSampleFile();
  }
  cout<<"job finished." << endl;
  return 0;
}
