defmodule Alice.Handlers.Shizzle do
  use Alice.Router

  command ~r/\bshizzle\s+me (?<term>.+)/i, :tranzizzle
  route   ~r/\Ashizzle\s+me (?<term>.+)/i, :tranzizzle
  command ~r/\bshizzle\s+url (?<term>.+)/i, :querizzle
  route   ~r/\Ashizzle\s+url (?<term>.+)/i, :querizzle

  def handle(conn, name) when name in [:tranzizzle, :querizzle] do
    conn
    |> extract_term
    |> shizzlize(name)
    |> reply(conn)
  end

  defp shizzlize(text, :tranzizzle), do: text |> Gizoogle.translate
  defp shizzlize(text, :querizzle) do
    text |> santize_url |> Gizoogle.url
  end

  defp santize_url(url) do
    url |> String.replace(~r/\A<([^|]+)(.*)?>\z/, "\\1")
  end

  defp extract_term(conn) do
    conn.message.captures
    |> Enum.reverse
    |> hd
  end
end
