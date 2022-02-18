defmodule PlugCowboyPlaygroundTest do
  use ExUnit.Case
  doctest PlugCowboyPlayground

  test "greets the world" do
    assert PlugCowboyPlayground.hello() == :world
  end
end
