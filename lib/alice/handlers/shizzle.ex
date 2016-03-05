defmodule Alice.Handlers.Shizzle do
  use Alice.Router

  @slack_url_pattern ~r/\A<([^|]+)(.*)?>\z/

  command ~r/\bshizzle\s+me (?<term>.+)/i, :tranzizzle
  route   ~r/\Ashizzle\s+me (?<term>.+)/i, :tranzizzle
  command ~r/\bshizzle\s+url (?<term>.+)/i, :querizzle
  route   ~r/\Ashizzle\s+url (?<term>.+)/i, :querizzle

  @doc "`shizzle me ____` - drop a rhyme like a thug"
  def tranzizzle(connizzle), do: handizzle(connizzle, :tranzizzle)

  @doc "`shizzle url ____` - link ta a tranzizzled url or search term"
  def querizzle(connizzle),  do: handizzle(connizzle, :querizzle)

  defp handizzle(connizzle, name) do
    connizzle
    |> extract_dat_term
    |> shizzlize(name)
    |> reply(connizzle)
  end

  defp extract_dat_term(connizzle) do
    connizzle.message.captures
    |> Enum.reverse
    |> hd
  end

  defp shizzlize(text, :tranzizzle), do: text |> Gizoogle.translate
  defp shizzlize(text, :querizzle),  do: text |> santizzle_url |> Gizoogle.url

  defp santizzle_url(url), do: url |> String.replace(@slack_url_pattern, "\\1")
end
