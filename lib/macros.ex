defmodule Macros do
  @moduledoc """
  A couple of assert macros
  have to import Macros from iex to use
  Macros.my_assert 1 == 2
  Macros.my_assert 1 == 1
  """
  defmacro my_assert({op,_,[lhs,rhs]}) do
    quote do
      do_my_assert(unquote(op),unquote(lhs),unquote(rhs))
    end
  end

  def do_my_assert(:==,lhs,rhs) when lhs == rhs do
    IO.puts("==")
  end
  def do_my_assert(:==,lhs,rhs) do
    IO.puts("!== #{lhs} and #{rhs}")
  end

  def do_my_assert(:>,lhs,rhs) when lhs > rhs do
    IO.puts(">")
  end
  def do_my_assert(:>,lhs,rhs) do
    IO.puts("! > #{lhs} and #{rhs}")
  end
end
