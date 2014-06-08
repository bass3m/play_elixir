defmodule BSTree do
  @moduledoc """
  Simple implementation of BST insertion and traversal.
  t = BSTree.new(1)
  t1 = BSTree.add_entry(t,2)
  t2 = BSTree.add_entry(t1,5)
  t3 = BSTree.add_entry(t2,3)
  t4 = BSTree.add_entry(t3,0)
  BSTree.traverse(:inorder,t4)
  Another tree:
  List.foldl([3,10,1,6,14,4,7],BSTree.add_entry(8),
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

end
