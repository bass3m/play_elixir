defmodule MaxConsecutiveSum do
  @moduledoc """
  Find the max consecutive sum of a list
  ex:  [-1, 5, 6, -2, 20, -50, 4] would be 29
  """
  def max_consec_sum(list), do: max_consec_sum(list,0,0)

  defp max_consec_sum([],_,max_so_far), do: max_so_far

  defp max_consec_sum([h | t],max_ending_here,max_so_far) do
    IO.puts("max_ending_here #{max_ending_here} max_so_far #{max_so_far}")
    max_consec_sum(t,
                   max(0,h + max_ending_here),
                   max(max_so_far,max_ending_here))
  end
end
