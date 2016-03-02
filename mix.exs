defmodule AliceShizzle.Mixfile do
  use Mix.Project

  def project do
    [app: :alice_shizzle,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "A handlez fo' tha Alice Slack bot fo' realz. Allows you ta drop a rhyme like a thug",
     package: package,
     deps: deps]
  end

  def application do
    [applications: [:httpoison]]
  end

  defp deps do
    [
      {:websocket_client, github: "jeremyong/websocket_client"},
      {:alice, "~> 0.1.4"},
      {:httpoison, "~> 0.8.0"}
    ]
  end

  defp package do
    [files: ["lib", "config", "mix.exs", "README*"],
     maintainers: ["Devin Clark"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/notdevinclark/alice_shizzle",
              "Docs"   => "https://github.com/notdevinclark/alice_shizzle"}]
  end
end
