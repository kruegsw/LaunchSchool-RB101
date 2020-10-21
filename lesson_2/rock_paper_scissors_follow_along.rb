VALID_CHOICES = %w(rock paper scissors)

def test_method
  prompt('test message')
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(choice, computer)
  if win?(choice, computer)
    prompt('You win!')
  elsif win?(computer, choice)
    prompt('You lose!')
  else
    prompt("You tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That is not a valid choice")
    end
  end

  computer_choice = ["rock", "paper", "scissors"].sample

  puts("You chose #{choice}.  Computer chose #{computer_choice}.")

  display_results(choice, computer_choice)

  prompt('Do you want to place again? (y/n)')
  answer = Kernel.gets().chomp()
  break if answer.downcase != "y"
end
