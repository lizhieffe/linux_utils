#include "shared_lib.h"

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
