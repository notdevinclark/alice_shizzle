defmodule AliceShizzle.Mixfile do
  use Mix.Project

  def project do
    [app: :alice_shizzle,
     version: "0.0.4",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "A handlez fo' tha Alice Slack bot fo' realz. Uses Gizoogle ta allow you ta drop a rhyme like a thug n' retrieve links fo' translated sitez",
     package: package,
     deps: deps]
  end

  def application do
    [applications: [:gizoogle]]
  end

  defp deps do
    [
      {:websocket_client, github: "jeremyong/websocket_client"},
      {:alice, "~> 0.1.4"},
      {:gizoogle, "~> 0.0.2"}
    ]
  end

  defp package do
    [files: ["lib", "config", "mix.exs", "README*"],
     maintainers: ["Devin Clark"],
     licenses: ["MIT"],
     links: %{"GitHub"          => "https://github.com/notdevinclark/alice_shizzle",
              "Docs"            => "https://github.com/notdevinclark/alice_shizzle",
              "Alice Slack bot" => "https://github.com/adamzaninovich/alice",
              "Gizoogle"        => "http://www.gizoogle.net"}]
  end
end
