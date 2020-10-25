words = "the flintstones rock"

p words.split.each { |word| word.capitalize! }.join(" ")

p words.split.map { |word| word.capitalize }.join(" ")