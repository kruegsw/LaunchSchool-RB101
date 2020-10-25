# receive string input from user
print 'Enter a string and I will return an array with the palindromes.'
str_input = gets.chomp

# input: substring, output: True if palindrome, False if not
def palindrome?(substr)
  substr == substr.reverse && substr.length > 1
end

# input: string , output:  array of all possible substrings 
def arr_all_possible_substrings(str)
  substring_array = []
  i = 0
  while i < str.length
    j = 0
    while j < str.length
      substring_array << str[i, j]
      j += 1
    end 
    i += 1
  end
  substring_array
end

# input:  user string, output: array of substrings that are palindromes
def str_palindromes(str)
  arr_palindromes = arr_all_possible_substrings(str).select { |substr| palindrome?(substr)}
end

p (str_palindromes(str_input))