defmodule BalanceParens do
  @moduledoc """
  Returns whether a string has a balanced number
  of parenthesis
  Examples:
  BalanceParens.balance("a(bc")
  false
  BalanceParens.balance("a(b)c")
  true
  """
  def balance(str) do
    balance(str,0)
  end
  def balance(str,acc) when str == "", do: acc == 0
  def balance(str,acc) do
    [h | [t]] = String.split(str,"",global: false)
    case h do
      "(" -> balance(t,acc + 1)
      ")" -> balance(t,acc - 1)
      _ -> balance(t,acc)
    end
  end
end
