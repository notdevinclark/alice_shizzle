defmodule Shizzle do
  def translate(text) do
    body = {:form, [translatetext: text]}
    HTTPoison.post("http://www.gizoogle.net/textilizer.php", body)
    |> case do
      {:ok, %HTTPoison.Response{body: body}} -> body
      {:error, reason} -> {:error, reason}
    end
    |> parse_html
  end

  defp parse_html({:error, reason}), do: "error: #{reason}"
  defp parse_html(html) do
    Shizzle.Parser.parse_html(html)
  end
end
