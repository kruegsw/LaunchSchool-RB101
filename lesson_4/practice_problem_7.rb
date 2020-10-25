statement_1 = "The Flintstones Rock"

unique_chars = statement_1.chars.uniq
unique_chars.map! { |char| [char, statement_1.count(char)] }
p unique_chars.to_h



statement_2 = "The Flintstones Rock"
p statement_2.chars.uniq.map! { |char| [char, statement_2.scan(char).size] }.to_h