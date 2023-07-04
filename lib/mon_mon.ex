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
  alias MonMon.Game.{Actions, Status}
  alias MonMon.{Game, Player}
  # alias MonMon.Game.Actions.attack()

  @computer_name "Balrog"
  @computer_moves [:move_random, :move_avarage, :move_heal]

  def create_player(name, move_random, move_avarage, move_heal) do
    Player.build(name, move_random, move_avarage, move_heal)
  end

  def start_game do
    IO.puts("What's your name?")
    name = IO.gets("") |> String.upcase() |> String.replace(" ", "")
    IO.puts("your name is #{name}")

    player = create_player(name, :kick, :punch, :healing)

    @computer_name
    |> create_player(:kick, :punch, :healing)
    |> Game.start(player)

    Status.print_round_message(Game.info())

    IO.puts("\nHow would you like to proceed?\n")
    IO.puts("Press 1 for kick, 2 for punch or 3 for healing\n")

    choice = IO.gets("")

    case choice do
      "1\n" -> make_move(:kick)
      "2\n" -> make_move(:punch)
      "3\n" -> make_move(:healing)
    end
  end

  def make_move(move) do
    Game.info()
    |> Map.get(:status)
    |> handle_status(move)
  end

  defp handle_status(:game_over, _move), do: Status.print_round_message(Game.info())

  defp handle_status(_other, move) do
    move
    |> Actions.fetch_move()
    |> do_move()

    # make the computer play automatic
    computer_move(Game.info())
  end

  defp do_move({:error, move}), do: Status.print_wrong_move_message(move)

  defp do_move({:ok, move}) do

    case move do
      :move_heal -> Actions.heal()
      move -> Actions.attack(move)
    end

    Status.print_round_message(Game.info())
  end

  defp computer_move(%{turn: :computer, status: :continue}) do
    # move = Enum.random([:kick, :punch, :healing])
    move = {:ok, Enum.random(@computer_moves)}
    do_move(move)

    IO.puts("Press 1 for kick, 2 for punch or 3 for healing\n")
    choice = IO.gets("")

    case choice do
      "1\n" -> make_move(:kick)
      "2\n" -> make_move(:punch)
      "3\n" -> make_move(:healing)
    end
  end

  defp computer_move(_), do: :ok
end

# player = MonMon.create_player("Natan", :kick, :punch, :healing)
# MonMon.start_game(player)
