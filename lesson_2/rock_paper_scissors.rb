require 'pry'

VALID_CHOICES = ['r', 'p', 'sc', 'sp', 'l'] #rock, paper, scissors, spock, lizard

def prompt(message)
  Kernel.puts("=> #{message}")
end

def get_user_input()
  prompt('Choose one: (r)ock, (p)aper, (sc)issors, (s)pock, (l)izard')
  user_choice = Kernel.gets().chomp()
end

def battle(user_choice, computer_choice)
  possibilities_array = [ ["r",  "p", "sc", "sp", "l"],
                          [0, 1, -1, -1, 1], #rock
                          [-1, 0, 1, 1, -1], #paper
                          [1, -1, 0, -1, 1], #scissors
                          [1, -1, 1, 0, -1], #spock
                          [-1, 1, -1, 1, 0], #lizard
                        ]
  user = VALID_CHOICES.index(user_choice)
  computer = VALID_CHOICES.index(computer_choice)
  result = possibilities_array[user+1][computer]
end

def print_battle_summary(user_choice, computer_choice, battle_result)
  win_lose_tie = if battle_result == 0 then "tie" elsif battle_result == -1 then "lose" else "win" end
  prompt("#{user_choice} vs #{computer_choice} --> you #{win_lose_tie}")
end


player_score = 0
computer_score = 0

while player_score < 5 && computer_score < 5
  user_choice = get_user_input()
  next unless VALID_CHOICES.include?(user_choice)
  computer_choice = VALID_CHOICES.sample

  battle_result = battle(user_choice, computer_choice)
  if battle_result == 1
    player_score += 1
  else battle_result == -1
    computer_score += 1
  end
      
  print_battle_summary(user_choice, computer_choice, battle_result)
end

puts "Player = #{player_score} :  Computer = #{computer_score}"
