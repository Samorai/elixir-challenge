defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    is_correct(nucleotide)
    is_correct_strand(strand)

    Enum.filter(strand, fn(x) -> x == nucleotide end)
    |> Enum.count

  end

  def is_correct_strand(strand) do
    map = get_map
    
    Enum.filter(strand, fn(x) -> 
      if Map.has_key?(map, x) == false do
        raise ArgumentError
      end
    end)
    |> Enum.count    
  end

  def is_correct(nucleotide) do
    result = get_map
    |> Map.has_key?(nucleotide)
    
    if false == result do
      raise ArgumentError
    end
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  def get_map do
    Enum.reduce(@nucleotides, %{}, fn (key, map) ->
        map
        |> Map.put(key, 0)
    end)
  end

  def get_map(strand) do
    Enum.reduce(@nucleotides, %{}, fn (key, map) ->
        map
        |> Map.put(key, count(strand, key))
    end)
  end

  @spec histogram([char]) :: map
  def histogram(strand) do
    strand
    |> get_map
  end
end
