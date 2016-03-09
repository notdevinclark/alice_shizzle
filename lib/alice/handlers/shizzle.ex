defmodule Alice.Handlers.Shizzle do
  use Alice.Router

  @slack_url_pattern ~r/\<([^|]+)(.*)?>/
  @slack_email_pattern ~r/\<mailto:([^|]+)(.*)?>/
  @slack_username_pattern ~r/\<@([^|]+)>/

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

  def handizzle(connizzle, name) do
    connizzle
    |> extract_dat_term
    |> santizzle(connizzle)
    |> shizzlize(name)
    |> reply(connizzle)
  end

  def extract_dat_term(connizzle) do
    connizzle.message.captures
    |> Enum.reverse
    |> hd
  end

  def shizzlize(text, :tranzizzle), do: text |> Gizoogle.translate
  def shizzlize(text, :querizzle),  do: text |> Gizoogle.url

  def santizzle(text, connizzle) do
    text
    |> santizzle_punctuations
    |> santizzle_urls
    |> santizzle_emails
    # |> santizzle_usernames(connizzle)
  end

  def santizzle_punctuations(text) do
    text
    |> String.replace("“", "\"")
    |> String.replace("”", "\"")
    |> String.replace("’", "'")
  end

  def santizzle_urls(text), do: text |> String.replace(@slack_url_pattern, "\\1")

  def santizzle_emails(text), do: text |> String.replace(@slack_email_pattern, "\\1")

  # def santizzle_usernames(text, connizzle), do: text |> String.replace(@slack_username_pattern, retreive_username("\\1", connizzle))

  # def retreive_username(username_code, connizzle) do
  #   connizzle.slack.users[username_code].name
  # end

  # def something(text, connizzle) do
  #   ~r/<@(.*?)>/
  #   |> Regex.scan(text)
  #   |> Enum.uniq
  #   |> something_else(text)
  # end

  # def something_else([], text)

  # def something_else([[matcher, match]|tail], text) do
    
  # end
end
