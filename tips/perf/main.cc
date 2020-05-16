// This is a test cc file for perf

#include <iostream>
#include <memory>
#include <string>

using ::std::cout;
using ::std::endl;
using ::std::string;

void InitString() {
  std::unique_ptr<string> s = std::make_unique<string>("abcd");
}

int main() {
  while (true) {
    InitString();
  }
  cout<<"job finished." << endl;
  return 0;
}
