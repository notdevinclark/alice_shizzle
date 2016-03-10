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
    |> extract_dat_term
    |> sanitizzle
    |> shizzlize(name)
    |> unhide_yo_usernames
    |> reply(connizzle)
  end

  defp extract_dat_term(connizzle) do
    connizzle.message.captures
    |> Enum.reverse
    |> hd
  end

  defp shizzlize(text, :tranzizzle), do: text |> Gizoogle.translate
  defp shizzlize(text, :querizzle),  do: text |> Gizoogle.url

  def sanitizzle(text) do
    text
    |> hide_yo_punctuations
    |> hide_yo_emails
    |> hide_yo_usernames
    |> hide_yo_urls
  end

  defp hide_yo_punctuations(text) do
    text
    |> String.replace("“", ~s("))
    |> String.replace("”", ~s("))
    |> String.replace("’", ~s('))
  end

  defp hide_yo_emails(text), do: text |> String.replace(~r/<mailto:([^|]+)[^\s]*>/i, "\\1")

  defp hide_yo_urls(text), do: text |> String.replace(~r/<([^|@]+)([^\s]*)?>/, "\\1")

  defp hide_yo_usernames(text), do: text |> String.replace(~r/<(@[\w\d]+)>/, "#:#\\1#:#")

  def unhide_yo_usernames(text), do: text |> String.replace(~r/#:#(@[\w\d]+)#:#/, "<\\1>")
end
