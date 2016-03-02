defmodule ShizzleTest do
  use ExUnit.Case, async: true

  test "translate translates aiiight english ta gangsta english" do
    input = "This is a completely normal and regular english sentence"
    output = "This be a cold-ass lil straight-up aiiight n' regular english sentence"
    assert Shizzle.translate(input) == output
  end
end
