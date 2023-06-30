defmodule MonMonTest do
  use ExUnit.Case
  doctest MonMon

  test "greets the world" do
    assert MonMon.hello() == :world
  end
end
