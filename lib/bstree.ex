defmodule BSTree do
  @moduledoc """
  Simple implementation of BST insertion and traversal.
  t = BSTree.new(1)
  t1 = BSTree.add_entry(2,t)
  t2 = BSTree.add_entry(5,t1)
  t3 = BSTree.add_entry(3,t2)
  t4 = BSTree.add_entry(0,t3)
  BSTree.traverse(:inorder,t4)
  """
  defstruct item: nil, left: nil, right: nil

  def new(item) do
    %BSTree{item: item}
  end

  def add_entry(new_item,
                %BSTree{item: item,
                        right: right} = tree) when new_item > item do
    %BSTree{tree | right: add_entry(new_item,right)}
  end

  def add_entry(new_item,
                %BSTree{item: item,
                        left: left} = tree) when new_item < item do
    %BSTree{tree | left: add_entry(new_item,left)}
  end

  def add_entry(new_item, %BSTree{} = tree) do
    %BSTree{tree | item: new_item}
  end

  def add_entry(new_item,tree) when tree == nil do
    new(new_item)
  end

  def traverse(:inorder,tree) when tree == nil do
  end

  def traverse(:inorder, %BSTree{item: item,
                                 left: left,
                                 right: right} = tree) do
    traverse(:inorder,left)
    IO.puts("Item : #{item}")
    traverse(:inorder,right)
  end

end
