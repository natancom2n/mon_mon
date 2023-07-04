defmodule MonMon.Player do
  @required_keys [:life, :name, :moves]

  @enforce_keys @required_keys
  defstruct @required_keys

  @max_life 100

  def build(name, move_random, move_avarage, move_heal) do
    %MonMon.Player{
      life: @max_life,
      name: name,
      moves: %{
        move_random: move_random,
        move_avarage: move_avarage,
        move_heal: move_heal
      }
    }
  end
end

# %MonMon.Player{life: 100, name: "natan", move_random: :kick, move_avarage: :punch, move_heal: :cura}
# MonMon.Player.build("Natan", :kick, :punch, :healing)
