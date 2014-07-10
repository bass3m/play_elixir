defmodule Destutter do
  @moduledoc """
  # Removes sequential duplicates, e.g.,
  # destutter([1,1,4,3,3,2])  = [1,4,3,2]
  """
  def destutter([]), do: []
  def destutter([h | t]), do: destutter(t,[h])
  def destutter([],acc), do: Enum.reverse(acc)
  def destutter([h | t],[hacc | _] = acc) when h == hacc do
    destutter(t,acc)
  end
  def destutter([h | t],acc) do
    destutter(t,[h | acc])
  end

end
