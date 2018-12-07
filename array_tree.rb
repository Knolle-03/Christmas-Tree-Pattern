# Aufgabe a08_2
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

# Class description
class ArrayTree
  def initialize(order)
    raise ArgumentError, "Argument must be Integer greater than 0." unless order.is_a?(Integer) && order > 0

    @order = order
    @tree = [%w[0 1]]
    grow_new_tree(order)
  end

  def show_tree
    space = ' ' * (@order + 1)
    width = @order + 1

    @tree.each do |row|
      background = (width - row.size) / 2
      puts space * background + row.join(' ') + space * background

    end
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
      if skip_next
        skip_next = false
        next
      end
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
        # add 0s in first line if it was inserted
      @tree[index].each { |element| element << '0' }
      skip_next = true
    end
      # add 0,1,1... in second line
    row.each_with_index { |element, i| element << ( i < 1 ? '0' : '1' ) }

    skip_next
  end
end

tree = ArrayTree.new(5)
tree.show_tree
