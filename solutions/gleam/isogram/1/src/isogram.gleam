import gleam/string
import gleam/list

fn has_punctuation(s: String) {
  !string.contains(" `~!@#$%^&*()-_=+[]{}:;\"',.<>/?", s)
}

pub fn is_isogram(phrase phrase: String) -> Bool {
  let all_letters =
  phrase
  |> string.lowercase
  |> string.to_graphemes()
  |> list.filter(fn(char: String) {
    has_punctuation(char)
  })

  let unique_letters =
  all_letters
  |> list.unique

  all_letters == unique_letters
}
