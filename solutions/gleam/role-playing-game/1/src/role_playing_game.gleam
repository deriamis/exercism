import gleam/option.{type Option, Some, None}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  option.unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health >= 1 {
    True -> None
    False -> case player.level >= 10 {
      True -> Some(Player(player.name, player.level, 100, Some(100)))
      False -> Some(Player(player.name, player.level, 100, player.mana))
    }
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player {
    Player(mana: mana, ..) -> case mana {
      Some(number) -> case number >= cost {
        True -> #(Player(player.name, player.level, player.health, Some(number - cost)), cost * 2)
        False -> #(player, 0)
      }
      None -> case player.health <= cost {
        True -> #(Player(player.name, player.level, 0, player.mana), 0)
        False -> #(Player(player.name, player.level, player.health - cost, player.mana), 0)
      }
    }
  }
}
