defmodule Primes do
  @moduledoc """
  Prime number functions
  For example: take the first 10 primes
  Stream.iterate(0,&(&1 + 1))
  |> Stream.filter(&(Primes.is_prime?/1))
  |> Enum.take(10)
  [1, 2, 3, 5, 7, 11, 13, 17, 19, 23]

  For implementation using sieve:
  Primes.primes(23)
  [2, 3, 5, 7, 11, 13, 17, 19, 23]
  """

  def is_prime?(1), do: true
  def is_prime?(n) do
    is_prime?(n,n-1)
  end
  defp is_prime?(_n,1), do: true
  defp is_prime?(n,i) do
    case rem(n,i) do
      0 -> false
      _ -> is_prime?(n,i - 1)
    end
  end

  # helper functions
  defp natural_nums() do
    Stream.iterate(2,&(&1 + 1))
  end
  defp sift(n,list) do
    Enum.filter(list,fn(x) -> rem(x,n) != 0 end)
  end
  defp sieve([]), do: []
  defp sieve([h | t] = _list) do
    [h | sieve(sift(h,t))]
  end

  @doc """
  Elixir implementation of Sieve of Eratosthenes
  """
  def primes(n) do
    natural_nums()
    |> Enum.take(n)
    |> sieve
  end
end
