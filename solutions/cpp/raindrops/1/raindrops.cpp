#include <string>
#include "raindrops.h"

namespace raindrops {

std::string convert(int raindrop) {
  std::string result = "";

  if (raindrop % 3 == 0) {
    result += "Pling";
  }
  if (raindrop % 5 == 0) {
    result += "Plang";
  }
  if (raindrop % 7 == 0) {
    result += "Plong";
  }
  if (result == "") {
    result += std::to_string(raindrop);
  }

  return result;
}

}  // namespace raindrops
