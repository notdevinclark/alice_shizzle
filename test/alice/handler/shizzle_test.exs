defmodule Alice.Handlers.ShizzleTest do
  use ExUnit.Case, async: true

  alias Alice.Handlers.Shizzle

  test "unhide_yo_usernames unsanitizes ratchet-ass usernames" do
    username_string = "yo <@U02EGPSD3>"
    clean_string = "yo #:#@U02EGPSD3#:#"
    assert Shizzle.unhide_yo_usernames(clean_string) == username_string
  end
end
