defmodule MonMon do
  @moduledoc """
  Documentation for `MonMon`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MonMon.hello()
      :world

  """
  alias MonMon.Player

  def create_player(name, move_random, move_avarage, move_heal) do
    Player.build(name, move_random, move_avarage, move_heal)
  end
end

# MonMon.create_player("Natan", :kick, :punch, :healing)
