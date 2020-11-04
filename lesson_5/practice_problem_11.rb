arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr_new = []

arr.each do |sub_array|
 arr_new << sub_array.select { |num| num % 3 == 0 }
end

arr_new

arr_new2 = arr.map do |sub_array|
  sub_array.select { |num| num % 3 == 0 }
end

p arr_new2