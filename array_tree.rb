# Aufgabe a08_2
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

# Class description
class ArrayTree
  def initialize(n)
    raise ArgumentError, "Argument must be Integer greater than 0." unless n.is_a?(Integer) && n > 0

    @tree = [%w[0 1]]
    grow_new_tree(n)
  end

  def show_tree
    # put tree here
    @tree.to_s
  end

  def tree
    @tree.join("\n")
  end

  private

  def grow_new_tree(n)
    (n-1).times do
      grow_one_order
      # TODO: endlosschleife. moep.
    end
    puts "Gardening success! A new tree of order #{n} was grown."
  end

  def grow_one_order
    skip_next = false
    @tree.each_with_index do |row, index|
      next if skip_next
      skip_next = grow_row(row, index)
    end
  end

  def grow_row(row, index)
    skip_next = false
      # copy first element and insert (shortened) prior line
    row.insert(1, row[0].dup)
    if row.size > 2
      tmp = []
      row.each_with_index { |element, i| tmp << element.dup if i > 1 }
      @tree.insert(index, tmp)
      # @tree.insert(index, row.drop(2).dup)
      skip_next = true
    end
      # add 0s in first line and 0,1,1... in second line
    @tree[index].each { |element| element << '0' }
    row.each_with_index { |element, i| element << ( i < 1 ? '0' : '1' ) }

    skip_next
  end
end

tree = ArrayTree.new(3)
puts tree.tree
tree.show_tree
