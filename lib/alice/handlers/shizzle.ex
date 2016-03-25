defmodule Alice.Handlers.Shizzle do
  use Alice.Router

  command ~r/\bshizzle\s+me (?<term>.+)/i, :tranzizzle
  route   ~r/\Ashizzle\s+me (?<term>.+)/i, :tranzizzle
  command ~r/\bshizzle\s+url (?<term>.+)/i, :querizzle
  route   ~r/\Ashizzle\s+url (?<term>.+)/i, :querizzle

  @doc "`shizzle me ____` - drop a rhyme like a thug"
  def tranzizzle(connizzle) do
    handizzle(connizzle, :tranzizzle)
  end

  @doc "`shizzle url ____` - link ta a tranzizzled url or search term"
  def querizzle(connizzle),  do: handizzle(connizzle, :querizzle)

  defp handizzle(connizzle, name) do
    connizzle
    |> Alice.Conn.last_capture
    |> hide_yo_usernames
    |> shizzlize(name)
    |> unhide_yo_usernames
    |> reply(connizzle)
  end

  defp shizzlize(text, :tranzizzle), do: text |> Gizoogle.translate
  defp shizzlize(text, :querizzle),  do: text |> Gizoogle.url

  defp hide_yo_usernames(text), do: text |> String.replace(~r/<(@[\w\d]+)>/, "#:#\\1#:#")

  def unhide_yo_usernames(text), do: text |> String.replace(~r/#:#(@[\w\d]+)#:#/, "<\\1>")
end
