hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, hash|
  hash.each { |word| puts word.scan(/[aeiouAEIOU]/) }
end

hsh.values.flatten.each { |word| word.scan(/[aeiouAEIOU]/)}
