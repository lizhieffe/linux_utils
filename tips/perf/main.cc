// This is a test cc file for perf

#include <iostream>
#include <memory>
#include <string>

#include "shared_lib.h"

using ::std::cout;
using ::std::endl;
using ::std::string;

int main() {
  while (true) {
    InitString();
  }
  cout<<"job finished." << endl;
  return 0;
}
