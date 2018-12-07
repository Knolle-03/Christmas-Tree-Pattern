class Integer
  def !
    (2..self).reduce(1, :*)
  end
end

class ChristmasTree
  attr_reader :rows
  def initialize(num)
    @num = num
    @rows = binomial_coefficient(num)
    @columns = num + 1
    @arrays = [%w[0 1]]
  end

  def bit_strings(num)
    bits = %w[0 1]
    permuts = bits.repeated_permutation(num).to_a
    joined = []
    permuts.each { |permut| joined << permut.join }
    joined
  end

  def binomial_coefficient(num)
    num.! / ((num - (num / 2).ceil).! * (num / 2).ceil.!)
  end

  def create_tree
    index = -1
    bla = @arrays[index].dup
    bla.shift
    bla.each do |element|
      @arrays.unshift(element + '0')
    end
    @arrays[index]
    puts @arrays.to_s
  end

  # def add(number)
  #   self + number.to_s
  # end
end

t1 = ChristmasTree.new(4)
t1.create_tree
puts t1.binomial_coefficient(8)



# arrays = []
# bits = %w[0 1]
# arrays << bits
#
# puts arrays.to_s
# index = 0
# nested_ary = []
# arrays << nested_ary
# nested_ary << (arrays[index][0].dup << '0')
# nested_ary << (arrays[index][0].dup << '1')
# nested_ary << (arrays[index][1].dup << '1')
#
# arrays[index].shift
#
# arrays[index].each do |element|
#   element << '0'
# end
#
# puts arrays.to_s
#
#
# if arrays[0].length == 1
#   lol = arrays[0].dup
#   puts arrays.to_s
#   arrays.unshift([lol[0] << '0'])
# end
# puts arrays.to_s
# num = 11
# bits = %w[0 1]
# permuts = bits.repeated_permutation(num).to_a
# joined = []
# permuts.each_with_index { |permut, index| joined << "#{permut.join } index:#{index}" }
# puts joined
