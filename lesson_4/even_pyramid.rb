puts 'enter number greater than 2:  '
num = gets.chomp.to_i
puts
puts 'enter row of pyramid:  '
row_to_sum = gets.chomp.to_i

def even_only_array(num)
  (2..num).select { |x| x.even? }
end

def build_pyramid_array(arr)
  pyramid = []

  row = 0
  while arr.size > 0
    pyramid << arr.slice!(0, row + 1)
    row += 1
  end
  pyramid
end

def sum_of_row(row, pyramid)
  sum = 0
  pyramid[row - 1].each { |x| sum += x }
  sum
end

evens_only = even_only_array(num)
pyramid_arr = build_pyramid_array(evens_only)
sum = sum_of_row(row_to_sum, pyramid_arr)
p sum
