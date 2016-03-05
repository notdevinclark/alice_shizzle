# AliceShizzle

[![Hex.pm](https://img.shields.io/hexpm/l/alice_shizzle.svg)](https://hex.pm/packages/alice_shizzle)
[![Hex.pm](https://img.shields.io/hexpm/v/alice_shizzle.svg)](https://hex.pm/packages/alice_shizzle)
[![Hex.pm](https://img.shields.io/hexpm/dt/alice_shizzle.svg)](https://hex.pm/packages/alice_shizzle)

A handlez fo' tha [Alice Slack bot] fo' realz. Allows you ta drop a rhyme like
a thug by utilizin [Gizoogle](http://www.gizoogle.net/textilizer.php).

[Alice Slack bot]: https://github.com/alice-bot/alice

**Warning:** This may contain profanitizzle n' other possibly bitch ass terms,
obviously take dis as parodizzle.

![](http://i.imgur.com/NrZyeAb.png)

## Installation

If [available up in Hex](https://hex.pm/packages/alice_shizzle), tha package
can be installed as:

  1. Add `alice_shizzle` ta yo' list of dependencies up in `mix.exs`:

    ```elixir
    defp deps do
      [
        {:websocket_client, github: "jeremyong/websocket_client"},
        {:alice, "~> 0.2.0"},
        {:alice_shizzle, "~> 0.1.0"}
      ]
    end
    ```

  2. Add tha handlez ta yo' list of registered handlezs in `mix.exs`:

    ```elixir
    def application do
      [applications: [:alice],
        mod: {
          Alice, [Alice.Handlers.Shizzle, ...]}]
    end
    ```

## Usage

Hit up `@alice help` fo' mo' shiznit.
