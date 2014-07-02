defmodule Combine do
  @moduledoc """
  Combinations:
  given a non-negative integer n, return all size n combinations
  """
  def comb(0,_), do: [[]]
  def comb(_,[]), do: []
  def comb(n,[h | t]) do
    (for l <- comb(n - 1,t), do: [h | l]) ++ comb(n,t)
  end

end
