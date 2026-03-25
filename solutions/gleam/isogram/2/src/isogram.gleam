import gleam/string
import gleam/list

fn has_punctuation(s: String) {
  !string.contains(" `~!@#$%^&*()-_=+[]{}:;\"',.<>/?", s)
}

pub fn is_isogram(phrase phrase: String) -> Bool {
  phrase
  |> string.lowercase
  |> string.to_graphemes()
  |> list.filter(fn(char: String) {
    has_punctuation(char)
  })
  |> fn(chars: List(String)) { chars == list.unique(chars) }
}
