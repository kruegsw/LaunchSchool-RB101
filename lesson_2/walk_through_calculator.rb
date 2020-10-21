LANGUAGE = 'es'
require 'yaml'
MESSAGES = YAML.load_file('calculator_message.yml')
MESSAGES.inspect

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  Integer(num) || Float(num) rescue false
end

def messages(message, language = 'en')
  MESSAGES[language][message]
end

prompt(messages('welcome', LANGUAGE))


loop do
  num1 = nil
  loop do
    prompt("=> enter number one:  ")
    num1 = Kernel.gets().chomp()

    if valid_number?(num1)
      break
    else
      prompt("This is not a valid_number")
    end
  end

  num2 = nil
  loop do
    prompt("=> enter number two:  ")
    num2 = Kernel.gets().chomp()

    if valid_number?(num2)
      break
    else
      prompt("THis is not a valid_number")
    end
  end

  operator_prompt = <<-MSG
  What operation would you like to perform?
  1) add
  2) subtract
  3) multiply
  4) divide
  MSG

  prompt(operator_prompt)
  operation = Kernel.gets().chomp().to_i

  answer = case operation
          when 1
            num1.to_i() + num2.to_i()
          when 2
            num1.to_i() - num2.to_i()
          when 3
            num1.to_i() * num2.to_i()
          when 4
            num1.to_f() / num2.to_f()
          end

prompt("Your answer is #{answer}")

prompt("do you want to perform another calc?  Y or N")
again = Kernel.gets().chomp().downcase
unless again == "y" then break end

end

prompt("OK you have left the calc loop.")
