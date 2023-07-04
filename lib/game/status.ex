defmodule MonMon.Game.Status do
  # alias MonMon.Game
  def print_round_message(%{status: :started} = info) do
    IO.puts("\n =======The Game is starterd!=============")
    # for print a struct use IO.inspect, IO.info doesnt work
    IO.inspect(info)
    IO.puts("------------------------------------------------------------")
  end

  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("\n ======= It's turn of #{player}!=============")
    # for print a struct use IO.inspect, IO.info doesnt work
    IO.inspect(info)
    IO.puts("------------------------------------------------------------")
  end

  def print_round_message(%{status: :game_over} = info) do
    # for print a struct use IO.inspect, IO.info doesnt work
    IO.inspect(info)
    IO.puts("------------------------------------------------------------")
    IO.puts("\n ======= The Game is Over!=============")
    IO.puts("\n ======= The Game is Over!=============")
    IO.puts("\n ======= The Game is Over!=============")
    IO.puts("\n ======= The Game is Over!=============")
    IO.puts("\n ======= The Game is Over!=============")
    IO.puts("\n ======= The Game is Over!=============")
    IO.puts("\n ======= The Game is Over!=============")
    IO.puts("\n ======= The Game is Over!=============")
    IO.puts("\n ======= The Game is Over!=============")
    IO.puts("\n ======= The Game is Over!=============")
    IO.puts("\n ======= The Game is Over!=============")
    IO.puts("\n ======= The Game is Over!=============")
    IO.puts("\n ======= The Game is Over!=============")
    IO.puts("\n ======= The Game is Over!=============")
    IO.puts("\n ======= The Game is Over!=============")
    IO.puts("\n ======= The Game is Over!=============")
  end

  def print_wrong_move_message(move) do
    IO.puts("\n ======= Invalid Move ( #{move} )=============\n")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("\n =======  The Player attacked the Enemy dealing #{damage} damage. =============\n")
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts("\n =======  The Enemy attacked the Player dealing #{damage} damage. =============\n")
  end

  def print_move_message(player, :healing, life) do
    IO.puts("\n =======  The #{player} healled itself to #{life} life points. =============\n")
  end
end
