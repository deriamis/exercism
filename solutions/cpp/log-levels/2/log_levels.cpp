#include <string>

namespace log_line {
std::string message(std::string line) {
    if (line.find("[ERROR]: ") == 0) {
      return line.substr(9);
    }
    if (line.find("[WARNING]: ") == 0) {
      return line.substr(11);
    }
    if (line.find("[INFO]: ") == 0) {
      return line.substr(8);
    }

    return line;
}

std::string log_level(std::string line) {
    if (line.find("[ERROR]: ") == 0) {
      return "ERROR";
    }
    if (line.find("[WARNING]: ") == 0) {
      return "WARNING";
    }
    if (line.find("[INFO]: ") == 0) {
      return "INFO";
    }

    return line;
}

std::string reformat(std::string line) {
  return message(line) + " (" + log_level(line) + ")";
}
}  // namespace log_line
