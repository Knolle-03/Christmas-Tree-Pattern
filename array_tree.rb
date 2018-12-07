# Aufgabe a08_2
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'tree_node'

# Class description
class ArrayTree
  def initialize(n)
    raise ArgumentError, "Argument must be Integer." unless n.is_a?(Integer)

    @tree = nil
    grow_new_tree(n)
  end

  def grow_new_tree(n)
    raise ArgumentError, "Argument must be Integer." unless n.is_a?(Integer)

    if n < 1
      puts 'Gardening warning: No new tree grown.'
      return
    else
      @tree = [[0, 1]]
    end

    (n-1).times do
      grow_one_order
      # TODO: endlosschleife. moep.
    end
    puts "Gardening success! A new tree of order #{n} was grown."
  end

  def grow_one_order
    @tree.each_with_index do |row, index|
      grow_row(row, index)
    end
  end

  def grow_row(row, index)
      # copy first element and insert (shortened) prior line
    row.insert(1, row[0])
    @tree.insert(index, row.drop(2)) unless row.drop(2).empty?
      # add 0s in first line and 0,0,1,1,1... in second line
    @tree[index].each { |v| v << 0 }
    row.each_with_index { |v, i| v << i < 1 ? 0 : 1 }
  end

  def show_tree
    if @tree == nil
      puts "Alas, there was no tree. Maybe grow one."
    else

    end
  end

  def tree
    @tree.dup
  end
end

tree = ArrayTree.new(12)
puts tree.tree
tree.show_tree
tree.grow_new_tree(2)
tree.grow_new_tree(0)
