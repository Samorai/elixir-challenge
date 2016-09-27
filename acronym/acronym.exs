defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @replace ~r/[A-Z]/
  @replacer " \\g{0}"
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
	@replace
  	|> Regex.replace(string, @replacer)
  	|> String.split
  	|> Enum.reduce([], fn (key, list) -> list ++ [normalize(key)] end)
  	|> List.to_string
  end

  def normalize(string) do
  	string
  	|> String.first
  	|> String.upcase
  end
end
