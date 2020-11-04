original_array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_array1 = original_array.map do |hash|
  hash.map { |k, v| {k => v+=1} }
end

p original_array
new_array1


new_array2 = original_array.map do |hash|
  hash.to_a.map { |k, v| [k, v+=1]}.to_h
end

new_array2



new_array3 = original_array.map do |hash|
  hash.map { |k, v| [k, v+=1] }.to_h
end

new_array3


new_array4 = original_array.map do |hsh|
  new_hsh = {}
  hsh.each { |k, v| new_hsh[k] = v+=1 }
  new_hsh
end

p new_array4