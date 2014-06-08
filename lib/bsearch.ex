defmodule Bsearch do
  @moduledoc """
  simple binary search
  """

  #data : list of sorted numbers
  #target : number we're looking for
  #low : current low index
  #high : current high index
  defp bsearch(data,target,low,high) when low <= high do
    mid = (low + high)/2 |> Float.floor
    cond do
      Enum.at(data,mid) > target ->
        bsearch(data,target,low,mid-1)
      Enum.at(data,mid) < target ->
        bsearch(data,target,mid+1,high)
      Enum.at(data,mid) == target ->
        IO.puts("Found target #{target} at: #{mid}")
    end
  end

  defp bsearch(data,target,_low,_high) do
    IO.puts("Not Found target #{target} in: #{inspect data}")
  end

  @doc """
  data : list of sorted numbers
  target : number we're looking for
  """
  def bsearch(data,target) do
    bsearch(data,target,0,length(data)-1)
  end
end
