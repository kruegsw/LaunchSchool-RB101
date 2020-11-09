require "pry-byebug"

a = 1
b = 1
arr = []

loop do
  arr << [a, b]
  puts "#{a}, #{b}"
  a += 1
  binding.pry
  b +=1 if a.even?
  break if a > 10
end