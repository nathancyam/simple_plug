defmodule PlugSimpleTest do
  use ExUnit.Case
  doctest PlugSimple

  test "greets the world" do
    assert PlugSimple.hello() == :world
  end
end
