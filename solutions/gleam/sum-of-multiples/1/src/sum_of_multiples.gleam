import gleam/int
import gleam/list

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  list.range(1, limit - 1)
  |> list.filter(fn(n: Int) {
    factors
    |> list.any(fn(factor: Int) {
      factor > 0 && n % factor == 0
    })
  })
  |> list.unique
  |> int.sum
}
