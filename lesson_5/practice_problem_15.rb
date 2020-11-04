arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.reject do |hsh|
  hsh_numbers = []
  hsh.each_value { |num_array| hsh_numbers << num_array }
  hsh_numbers.flatten.any? { |num| num.odd? }
end


arr2 = arr.reject do |hsh|
  hsh.any? { |k, v | v.any? { |num| num.odd? } }
end

p arr2