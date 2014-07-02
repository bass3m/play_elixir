defmodule Combine do
  @moduledoc """
  Combinations:
  given a non-negative integer n, return all size n combinations
  Combine.comb(2,[1,2,3])
  [[1, 2], [1, 3], [2, 3]]
  """

  @doc """
  comb(combination_size, list)
  """
  def comb(0,_), do: [[]]
  def comb(_,[]), do: []
  def comb(n,[h | t]) do
    (for l <- comb(n - 1,t), do: [h | l]) ++ comb(n,t)
  end

end
