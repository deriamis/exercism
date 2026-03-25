import gleam/string

fn find_pairs(left: List(String), right: List(String)) -> Bool {
  case left, right {
    [], [] -> True
    [], _ -> False
    ["(", ..rest], _ -> find_pairs(rest, ["(", ..right])
    ["[", ..rest], _ -> find_pairs(rest, ["[", ..right])
    ["{", ..rest], _ -> find_pairs(rest, ["{", ..right])
    ["<", ..rest], _ -> find_pairs(rest, ["<", ..right])
    [")", ..rest], ["(", ..others] -> find_pairs(rest, others)
    ["]", ..rest], ["[", ..others] -> find_pairs(rest, others)
    ["}", ..rest], ["{", ..others] -> find_pairs(rest, others)
    [">", ..rest], ["<", ..others] -> find_pairs(rest, others)
    [")", ..], _ | ["]", ..], _ | ["}", ..], _ | [">", ..], _ -> False
    [_, ..rest], _ -> find_pairs(rest, right)
  }
}

pub fn is_paired(value: String) -> Bool {
  find_pairs(string.to_graphemes(value), [])
}
