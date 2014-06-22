defmodule Pascal do
  @moduledoc """
  Pascal's triangle as follows:
      1
     1 1
    1 2 1
   1 3 3 1
  1 4 6 4 1
  0 1 2 3 4
  1         0
  1 1       1
  1 2 1     2
  1 3 3 1   3
  1 4 6 4 1 4
  iex(11)> 0..4
          |> Enum.into([])
          |> Enum.map(&(Pascal.pascal(&1,4)))
  [1, 4, 6, 4, 1]
  """
  def pascal(col,row) when col == row, do: 1
  def pascal(col,_row) when col == 0, do: 1
  def pascal(_col,row) when row == 0, do: 1
  def pascal(col,row) do
      pascal(col - 1,row - 1) + pascal(col,row - 1)
  end
end
