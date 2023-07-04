defmodule MonMon.GameTest do
  use ExUnit.Case

  alias MonMon.{Game, Player}

  describe "start/2" do
    test "starts the game state" do
      player = Player.build("Natan", :kick, :punch, :healing)
      computer = Player.build("Balrog", :kick, :punch, :healing)

      # assert Game.start(computer, player) == "nanan" #foced error
      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "return the current state of game" do
      player = Player.build("Natan", :kick, :punch, :healing)
      computer = Player.build("Balrog", :kick, :punch, :healing)

      Game.start(computer, player)

      expected_reponse = %{
        computer: %MonMon.Player{
          life: 100,
          name: "Balrog",
          moves: %{move_avarage: :punch, move_heal: :healing, move_random: :kick}
        },
        player: %MonMon.Player{
          life: 100,
          name: "Natan",
          moves: %{move_avarage: :punch, move_heal: :healing, move_random: :kick}
        },
        status: :started,
        turn: :player
      }

      # assert Game.info() == "cheba" #forced error
      assert expected_reponse = Game.info()
    end
  end

  describe "update/1" do
    test "return the game state updated" do
      player = Player.build("Natan", :kick, :punch, :healing)
      computer = Player.build("Balrog", :kick, :punch, :healing)

      Game.start(computer, player)

      expected_reponse = %{
        computer: %MonMon.Player{
          life: 100,
          name: "Balrog",
          moves: %{move_avarage: :punch, move_heal: :healing, move_random: :kick}
        },
        player: %MonMon.Player{
          life: 100,
          name: "Natan",
          moves: %{move_avarage: :punch, move_heal: :healing, move_random: :kick}
        },
        status: :started,
        turn: :player
      }

      # assert Game.info() == "cheba" #forced error
      assert expected_reponse = Game.info()

      new_state = %{
        computer: %MonMon.Player{
          life: 85,
          name: "Balrog",
          moves: %{move_avarage: :punch, move_heal: :healing, move_random: :kick}
        },
        player: %MonMon.Player{
          life: 58,
          name: "Natan",
          moves: %{move_avarage: :punch, move_heal: :healing, move_random: :kick}
        },
        status: :started,
        turn: :player
      }

      Game.update(new_state)

      expected_reponse = %{new_state | turn: :computer, status: :continue}

      assert expected_reponse = Game.info()
    end
  end

  describe "player/0" do
    test "return a struct of player" do
      player = Player.build("Natan", :kick, :punch, :healing)
      computer = Player.build("Balrog", :kick, :punch, :healing)

      Game.start(computer, player)

      expected_reponse = %MonMon.Player{
        life: 100,
        name: "Natan",
        moves: %{move_avarage: :punch, move_heal: :healing, move_random: :kick}
      }

      assert expected_reponse = Game.player()
    end
  end

  describe "turn/0" do
    test "Return who is turn, :player or :computer" do
      player = Player.build("Natan", :kick, :punch, :healing)
      computer = Player.build("Balrog", :kick, :punch, :healing)

      Game.start(computer, player)

      assert :player = Game.turn()
    end
  end

  describe "fetch_player/1" do
    test "fetch a valid player: :computer or :player" do
      player = Player.build("Natan", :kick, :punch, :healing)
      computer = Player.build("Balrog", :kick, :punch, :healing)

      Game.start(computer, player)

      expected_response = %MonMon.Player{
        life: 10,
        name: "Natan",
        moves: %{move_avarage: :punch, move_heal: :healing, move_random: :kick}
      }

      assert expected_response = Game.fetch_player(:player)
    end
  end
end
