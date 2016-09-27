defmodule Bob do

  @answers %{
  	:question => "Sure.",
  	:something => "Whoa, chill out!",
  	:normal => "Whatever.",
  	:silence => "Fine. Be that way!"
  }

  def hey(input) do
    cond do
    	question? input -> @answers.question
		silence? input -> @answers.silence
		something? input -> @answers.something
		true -> @answers.normal
    end
  end

  defp question?(input), do: String.ends_with? input, "?"

  defp silence?(input), do: String.strip(input) === ""

  defp something?(input), do:
  	String.upcase(input) === input and String.downcase(input) !== input
end
