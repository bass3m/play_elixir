defmodule FizzBuzz do
  @moduledoc """
  Silly elixir fizzbuzz implementation:
  Use as follows:
  > range = 1..100
  iex  > range
  ... |> Stream.map(fn(n)->FizzBuzz.fizzbuzz(n) end)
  ... |> Enum.take(18)
  """
  def fizzbuzz(n) when rem(n,3) == 0 and rem(n,5) == 0 do
    "FizzBuzz"
  end
  def fizzbuzz(n) when rem(n,3) == 0 do
    "Fizz"
  end
  def fizzbuzz(n) when rem(n,5) == 0 do
    "Buzz"
  end
  def fizzbuzz(n), do: n
end
