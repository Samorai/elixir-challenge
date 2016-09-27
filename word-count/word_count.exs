defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @replace ~r/[^a-zA-Zö0-9-]/
  @spec count(String.t) :: map
  def count(sentence) do
  	@replace
  	|> Regex.replace(sentence, " ")
  	|> String.downcase
  	|> String.split
  	|> Enum.reduce(%{}, fn (key, map) -> Map.update(map, key, 1, &(&1 + 1)) end)
  end
end
