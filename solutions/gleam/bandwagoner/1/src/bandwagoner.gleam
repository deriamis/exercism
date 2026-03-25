pub type Coach {
  Coach(name: String, former_player: Bool)
}

pub type Stats {
  Stats(wins: Int, losses: Int)
}

pub type Team {
  Team(name: String, coach: Coach, stats: Stats)
}

pub fn create_coach(name: String, former_player: Bool) -> Coach {
  Coach(name: name, former_player: former_player)
}

pub fn create_stats(wins: Int, losses: Int) -> Stats {
  Stats(wins: wins, losses: losses)
}

pub fn create_team(name: String, coach: Coach, stats: Stats) -> Team {
  Team(name: name, coach: coach, stats: stats)
}

pub fn replace_coach(team: Team, coach: Coach) -> Team {
  Team(name: team.name, coach: coach, stats: team.stats)
}

pub fn is_same_team(home_team: Team, away_team: Team) -> Bool {
  home_team == away_team
}

pub fn root_for_team(team: Team) -> Bool {
  case team {
    Team(name: name, coach: coach, stats: stats) -> case coach.name == "Gregg Popovich" {
      True -> True
      _ -> case coach.former_player {
        True -> True
        False -> case name == "Chicago Bulls" {
          True -> True
          False -> case stats.wins >= 60 {
            True -> True
            False -> case stats.losses > stats.wins {
              True -> True
              False -> False
            }
          }
        }
      }
    }
  }
}
