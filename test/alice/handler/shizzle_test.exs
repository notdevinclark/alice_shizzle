defmodule Alice.Handlers.ShizzleTest do
  use ExUnit.Case, async: true

  alias Alice.Handlers.Shizzle

  test "sanitizzle sanitizes jive-ass quotes" do
    assert Shizzle.sanitizzle("“”’") == ~s(""')
  end

  test "sanitizzle sanitizes punk-ass urls" do
    url_string = "I go to <http://cnn.com|cnn.com> for my news!"
    clean_string = "I go to http://cnn.com for my news!"
    assert Shizzle.sanitizzle(url_string) == clean_string
  end

  test "sanitizzle sanitizes dusty-ass emails" do
    email_string = "I email all me kitten gifs to <mailto:user@example.com|user@example.com>!"
    clean_string = "I email all me kitten gifs to user@example.com!"
    assert Shizzle.sanitizzle(email_string) == clean_string
  end

  test "sanitizzle sanitizes ratchet-ass usernames" do
    username_string = "yo <@U02EGPSD3>"
    clean_string = "yo #:#@U02EGPSD3#:#"
    assert Shizzle.sanitizzle(username_string) == clean_string
  end

  test "unhide_yo_usernames unsanitizes ratchet-ass usernames" do
    username_string = "yo <@U02EGPSD3>"
    clean_string = "yo #:#@U02EGPSD3#:#"
    assert Shizzle.unhide_yo_usernames(clean_string) == username_string
  end

  test "errrrrthing works" do
    big_ass_string = "<@U02EGPSD3>’s <http://CNN.com|CNN.com> email address is <mailto:user@example.com|user@example.com> and don’t you “forget” it dude! Email <@U025Q5H6D> here, at <http://CNN.com|CNN.com>"
    clean_ass_string = ~s(<@U02EGPSD3>'s http://CNN.com email address is user@example.com and don't you "forget" it dude! Email <@U025Q5H6D> here, at http://CNN.com)
    assert clean_ass_string == (big_ass_string |> Shizzle.sanitizzle |> Shizzle.unhide_yo_usernames)
  end
end
