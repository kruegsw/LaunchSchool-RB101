require "pry" # add this to use Pry

counter = 0

loop do
  counter += 1
  break if counter == 5
  binding.pry #ctrl+d to cycle through loop
end