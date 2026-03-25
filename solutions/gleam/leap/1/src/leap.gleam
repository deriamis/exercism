pub fn is_leap_year(year: Int) -> Bool {
  case year % 4 {
    0 -> case year % 100 {
      0 -> year % 400 == 0
      _ -> True
    }
    _ -> False
  }
}
