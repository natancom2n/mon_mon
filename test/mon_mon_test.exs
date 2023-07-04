defmodule MonMon.MonMonTest do
  alias Erl2ex.Pipeline.ExMacro
  use ExUnit.Case
  import ExUnit.CaptureIO

  describe "create_player/1" do
    test "Return a player" do

      espect_responsed = %MonMon.Player{
        life: 100,
        name: "Natan",
        moves: %{move_avarage: :punch, move_heal: :healing, move_random: :kick}
      }
      assert espect_responsed = MonMon.create_player("Natan", :kick, :punch, :healing)
    end
  end

  # describe "make_move/1" do
  #   test "when the move is valid, do the move and the computer makes a move" do
  #     player = MonMon.Player.build("Natan", :kick, :punch, :healing)
  #     computer = MonMon.Player.build("Balrog", :kick, :punch, :healing)

  #     MonMon.Game.start(computer, player)

  #     messages =
  #       capture_io(fn ->
  #         MonMon.make_move(:kick)
  #       end)

  #     assert messages =~ "The Player attacked the Balrog"
  #     assert messages =~ "It's turn of computer!"
  #   end
  # end
end
