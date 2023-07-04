defmodule MonMon.Game do
  alias MonMon.Player
  use Agent

  def start(computer, player) do
    initial_value = %{computer: computer, player: player, turn: :player, status: :started}
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  # return the information about state of the game
  def info do
    Agent.get(__MODULE__, & &1)
  end

  def update(state) do
    # recived state and subscribe the same state
    Agent.update(__MODULE__, fn _ -> update_game_satus(state) end)
  end

  # map.get getting the data of key :player
  def player, do: Map.get(info(), :player)
  def turn, do: Map.get(info(), :turn)
  def fetch_player(player), do: Map.get(info(), player)

  defp update_game_satus(
         %{player: %Player{life: player_life}, computer: %Player{life: computer_life}} = state
       )
       when player_life == 0 or computer_life == 0,
       do: Map.put(state, :status, :game_over)

  defp update_game_satus(state) do
    state
    |> Map.put(:status, :continue)
    |> update_turn()
  end

  defp update_turn(%{turn: :player} = state), do: Map.put(state, :turn, :computer)
  defp update_turn(%{turn: :computer} = state), do: Map.put(state, :turn, :player)
end
