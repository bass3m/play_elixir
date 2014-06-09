defmodule MergeSorted do
  @moduledoc """
  Merge 2 sorted arrays
  """
  def merge_sorted(list1,list2) when list1 == [], do: list2
  def merge_sorted(list1,list2) when list2 == [], do: list1
  def merge_sorted(list1,list2) do
    merge_sorted(list1,list2,[])
  end
  defp merge_sorted([],list2,acc) do
    [list2 | acc] |> Enum.reverse |> List.flatten
  end
  defp merge_sorted(list1,[],acc) do
    [list1 | acc] |> Enum.reverse |> List.flatten
  end
  defp merge_sorted([h1 | t1] = list1,
                    [h2 | t2] = list2,acc) do
   case h1 < h2 do
     true -> merge_sorted(t1,list2,[h1 | acc])
     false -> merge_sorted(list1,t2,[h2 | acc])
   end
  end
end
