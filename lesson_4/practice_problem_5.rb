flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.index { |x| x.slice(0,2) == "Be" }

p flintstones.index { |x| x[0,2 == "Be" }