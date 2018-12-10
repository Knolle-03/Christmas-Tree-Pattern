# Aufgabe a08_2
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

# The ArrayTree Class gets an Integer as an argument and creates an ArrayTree of bit strings.
# The method show thee is called to print out the tree to the console.
class ArrayTree
  def initialize(order)
    raise ArgumentError, 'Argument must be an Integer greater than 0.' unless order.is_a?(Integer) && order > 0

    @skip_next = false
    @order = order
    @tree = [%w[0 1]]
    grow_new_tree(order)
  end

  def show_tree
    separator = ' '
    width = @order + 1
    space = separator * width
    @tree.each do |row|
      blanks = (width - row.size) / 2
      puts space * blanks + row.join(separator) + space * blanks
    end
  end

  private

  def grow_new_tree(number)
    (number - 1).times do
      grow_one_order
    end
    puts "Gardening success! A new tree of order #{number} was grown."
  end

  def grow_one_order
    @tree.each_with_index do |row, index|
      @skip_next = @skip_next ? false : grow_row(row, index)
    end
  end

  def grow_row(row, index)
    @skip_next = false
    # copy first element and insert (shortened) prior line
    row.insert(1, row[0].dup)
    add_row(row, index) if row.size > 2
    # add 0,1,1... in second line
    row.each_with_index { |element, i| element << (i < 1 ? '0' : '1') }
    @skip_next
  end

  def add_row(row, index)
    @skip_next = true
    tmp = []
    row.each_with_index { |element, i| tmp << element.dup if i > 1 }
    @tree.insert(index, tmp)
    # add 0s in first line if it was inserted
    @tree[index].each { |element| element << '0' }
  end
end

tree = ArrayTree.new(6)
tree.show_tree

