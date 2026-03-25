fn sum_to(n: Int) -> Int {
  case n == 0 {
    True -> 0
    False -> n + sum_to(n - 1)
  }
}

pub fn square_of_sum(n: Int) -> Int {
  let sum = sum_to(n)
  sum * sum
}

pub fn sum_of_squares(n: Int) -> Int {
  case n == 0 {
    True -> 0
    False -> n * n + sum_of_squares(n - 1)
  }
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
