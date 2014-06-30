defmodule MergeSort do
  @moduledoc """
  Merge sort implementation
  """

  defp merge(a,[]), do: a
  defp merge([],b), do: b
  defp merge([x | xs] = a, [y | ys] = b) do
    if x < y do
      [x] ++ merge(xs,b)
    else
      [y] ++ merge(a,ys)
    end
  end

  def merge_sort(list) when list == [], do: []
  def merge_sort([x | []]), do: [x]
  def merge_sort(list) do
    mid = Float.floor(length(list)/2)
    {h , t} = Enum.split(list,mid)
    merge(merge_sort(h),merge_sort(t))
  end
end
