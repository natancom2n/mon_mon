defmodule MonMon.Game.Actions do
  alias MonMon.Game
  alias MonMon.Game.Actions.{Attack, Heal}

  def attack(move) do
    case Game.turn() do
      :player -> Attack.attack_opponent(:computer, move)
      :computer -> Attack.attack_opponent(:player, move)
    end
  end

  def heal do
    case Game.turn() do
      :player -> Heal.heal_life(:player)
      :computer -> Heal.heal_life(:computer)
    end
  end

  # Fetch for knows if the data send is valid or not
  def fetch_move(move) do
    Game.player()
    |> Map.get(:moves)
    |> find_move(move)
  end

  defp find_move(moves, move) do
    Enum.find_value(moves, {:error, move}, fn {key, value} ->
      if value == move, do: {:ok, key}
    end)
  end
end
