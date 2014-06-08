defmodule BSTree do
  @moduledoc """
  Simple implementation of BST insertion and traversal.
  t = BSTree.new(1)
  t1 = BSTree.add_entry(t,2)
  t2 = BSTree.add_entry(t1,5)
  t3 = BSTree.add_entry(t2,3)
  t4 = BSTree.add_entry(t3,0)
  BSTree.traverse(:inorder,t4)
  Or more elixir like, another tree:
  List.foldl([3,10,1,6,14,4,7],
             BSTree.add_entry(8),
             fn (x,acc) -> BSTree.add_entry(acc,x) end)
  """
  defstruct item: nil, left: nil, right: nil

  def new(item) do
    %BSTree{item: item}
  end

  def add_entry(%BSTree{item: item,
                        right: right} = tree,new_item) when new_item > item do
    %BSTree{tree | right: add_entry(right,new_item)}
  end

  def add_entry(%BSTree{item: item,
                        left: left} = tree,new_item) when new_item < item do
    %BSTree{tree | left: add_entry(left,new_item)}
  end

  def add_entry(%BSTree{} = tree,new_item) do
    %BSTree{tree | item: new_item}
  end

  def add_entry(tree,new_item) when tree == nil do
    new(new_item)
  end

  def add_entry(new_item) do
    new(new_item)
  end

  def traverse(:inorder,tree) when tree == nil do
  end

  def traverse(:inorder, %BSTree{item: item,
                                 left: left,
                                 right: right} = _tree) do
    traverse(:inorder,left)
    IO.puts("Item : #{inspect item}")
    traverse(:inorder,right)
  end

  def min_depth(tree) when tree == nil, do: 0
  def min_depth(%BSTree{left: left, right: right} = _tree) do
    1 + min(min_depth(left),min_depth(right))
  end

  def max_depth(tree) when tree == nil, do: 0
  def max_depth(%BSTree{left: left, right: right} = _tree) do
    1 + max(min_depth(left),min_depth(right))
  end

  @doc """
  Find the lowest common ancestor for a tree giving two node values
  t3 = List.foldl([8,22,4,12,10,14],BSTree.add_entry(20),
                  fn (x,acc) -> BSTree.add_entry(acc,x) end)
  BSTree.lca(t3,10,14) => 12
  BSTree.lca(t3,14,8) => 8
  BSTree.lca(t3,10,22) => 20
  """
  def lca(%BSTree{left: left, right: _right, item: item} = _tree,
          item1,item2) when item1 < item and item2 < item do
    lca(left,item1,item2)
  end
  def lca(%BSTree{left: _left, right: right, item: item} = _tree,
          item1,item2) when item1 > item and item2 > item do
    lca(right,item1,item2)
  end
  def lca(%BSTree{item: item},item1,item2) do
    IO.puts("Least common ancestor for #{item1} and #{item2} Node #{item}")
  end

  @doc """
  Find out whether given tree is a BST,
  Does an inorder traversal and checks whether items are in the
  right order
  """
  def is_bst?(tree) when tree == nil, do: true
  def is_bst?(tree), do: is_bst?(tree,nil)
  defp is_bst?(tree, _acc) when tree == nil, do: nil
  defp is_bst?(%BSTree{left: left, item: item}, acc) when acc == nil do
    is_bst?(left,item)
  end
  defp is_bst?(%BSTree{item: item}, acc) when item > acc do
    IO.puts("Not a valid BST since #{item} > #{acc}")
    false
  end
  defp is_bst?(%BSTree{left: left, right: right}, acc) do
    is_bst?(left,acc)
    is_bst?(right,acc)
    true
  end
end
