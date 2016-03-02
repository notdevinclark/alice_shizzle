defmodule Alice.Handlers.Shizzle do
  use Alice.Router

  command ~r/(shizzle)\s+(me )?(?<term>.+)/i, :tranzizzle
  route   ~r/(shizzle)\s+(me )?(?<term>.+)/i, :tranzizzle

  def handle(conn, :tranzizzle) do
    conn
    |> extract_term
    |> Shizzle.translate
    |> reply(conn)
  end

  defp extract_term(conn) do
    conn.message.captures
    |> Enum.reverse
    |> hd
  end
end
