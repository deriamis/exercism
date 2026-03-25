import gleam/option
import gleam/regex
import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
    "[INFO]: " <> message -> string.trim(message)
    "[WARNING]: " <> message -> string.trim(message)
    "[ERROR]: " <> message -> string.trim(message)
    _ -> log_line
  }
}

pub fn log_level(log_line: String) -> String {
  let assert Ok(re) = regex.from_string("\\[([^\\]]+)\\]: .*")
  case regex.scan(re, log_line) {
    [match, .._] -> case option.values(match.submatches) {
      [submatch, .._] -> case submatch {
        _ -> string.lowercase(submatch)
      }
      _ -> log_line
    }
    _ -> log_line
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
