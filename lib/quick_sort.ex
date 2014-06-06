defmodule Quicksort do
  @doc """
  Implements quick sort in elixir using list comprehensions
  """
  def qsort([]), do: []
  def qsort([h | rest]) do
    qsort(for el <- rest, el < h, do: el) ++
    [h] ++
    qsort(for el <- rest, el > h, do: el)
  end
end
