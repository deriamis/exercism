pub type Approval {
  Yes
  No
  Maybe
}

pub type Cuisine {
  Korean
  Turkish
}

pub type Genre {
  Crime
  Horror
  Romance
  Thriller
}

pub type Activity {
  BoardGame
  Chill
  Movie(Genre)
  Restaurant(Cuisine)
  Walk(kilometers: Int)
}

pub fn rate_activity(activity: Activity) -> Approval {
  case activity {
    BoardGame -> No
    Chill -> No
    Movie(genre) -> case genre {
      Romance -> Yes
      _ -> No
    }
    Restaurant(cuisine) -> case cuisine {
      Korean -> Yes
      Turkish -> Maybe
    }
    Walk(kilometers) -> {
      case kilometers > 11 {
        True -> Yes
        False -> case kilometers > 6 {
          True -> Maybe
          _ -> No
        }
      }
    }
  }
}
