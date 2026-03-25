import gleam/order
import gleam/string

fn is_uppercase(s: String) -> Bool {
  case string.compare(s, string.uppercase(s)) {
    order.Eq -> case string.compare(s, string.lowercase(s)) {
      // If the string matches *both* uppercase and lowercase versions of itself,
      // it's a string of characters that can't be capitalized - and is therefore
      // not interpreted as YELLING.
      order.Eq -> False
      _ -> True
    }
    _ -> False
  }
}

pub fn hey(remark: String) -> String {
  case string.trim(remark) {
    "" -> "Fine. Be that way!"
    _ -> case string.ends_with(string.trim(remark), "?") {
      False -> case is_uppercase(remark) {
        False -> "Whatever."
        True -> "Whoa, chill out!"
      }
      True -> case is_uppercase(remark) {
        False -> "Sure."
        True -> "Calm down, I know what I'm doing!"
      }
    }
  }
}
