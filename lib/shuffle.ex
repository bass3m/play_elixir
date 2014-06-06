defmodule Shuffle do
  @moduledoc """
  Simple shuffling of a list
  """
  def shuffle(list) do
    shuffle(list,[])
  end
  def shuffle([],acc), do: acc
  def shuffle(list,acc) do
    {head,[x | xs]} = Enum.split(list,:random.uniform(length(list)) - 1)
    shuffle(head ++ xs,[x | acc])
  end
end
