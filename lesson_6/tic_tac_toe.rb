require "pry"

WINNG_COMBINATIONS =  [
                        [1, 2, 3],
                        [4, 5, 6],
                        [7, 8, 9],
                        [1, 4, 7],
                        [2, 5, 8],
                        [3, 6, 9],
                        [1, 5, 9],
                        [3, 5, 7]
                      ]

PLAYER = "X"

COMPUTER = "O"

EMPTY_BOARD = {
                1 => ' ',
                2 => ' ',
                3 => ' ',
                4 => ' ',
                5 => ' ',
                6 => ' ',
                7 => ' ',
                8 => ' ',
                9 => ' ',
              }

def play?
  puts "Would you like to play tic-tac-toe? (Y/N)"
  input = gets.chomp.downcase
  true if input.start_with?("y")
end

def print_board(brd, player, computer)
  puts "Player ('X') score is #{player}.  Computer ('O') score is #{computer}.  First to 5 wins."
  puts
  puts "|#{brd[1]}|#{brd[2]}|#{brd[3]}|"
  puts "|#{brd[4]}|#{brd[5]}|#{brd[6]}|"
  puts "|#{brd[7]}|#{brd[8]}|#{brd[9]}|"
  puts
end

def available_moves(brd)
  brd.keys.select { |square| brd[square] == ' ' }
end

def joinor(array, delimiter = ", ", word = "or")
  case array.size
  when 0 then ''
  when 1 then array.first
  when 2 then array.join(" #{word} ")
  else
    array[-1] = "#{word} #{array.last}"
    array.join(delimiter)
  end
end

def user_move(brd)
  loop do
    puts "Available squares: #{ joinor(available_moves(brd), ', ', 'or') }"
    input = gets.chomp.to_i
    if available_moves(brd).include?(input)
      brd[input] = PLAYER
      break
    end
    puts "Select an available location."
  end
end

def computer_move(brd)
  
  if immediate_threat_or_win_two(brd)
    brd[immediate_threat_or_win_two(brd)] = COMPUTER
  else
    brd[available_moves(brd).sample] = COMPUTER
  end

end

def winner?(brd)
  check_for_winner = WINNG_COMBINATIONS.map do |combination|
    combination.map { |x| brd[x] }
  end

  check_for_winner.each do |x|
    return 'Player' if x.count('X') == 3
    return 'Computer' if x.count('O') == 3
  end

  nil
end

def tie?(brd)
  available_moves(brd).size == 0 
end


def immediate_threat_or_win_two(brd)

  next_move = nil

  next_move = 5 if brd[5] == ' '

  WINNG_COMBINATIONS.each do |combination|
    positions = brd.values_at(*combination)
    #binding.pry

    if positions.count("O") == 2 && positions.count(' ') == 1
      next_move = brd.select { |k, v| combination.include?(k) && v == ' '  }.keys[0]
      #binding.pry
      return next_move
    end

    if positions.count("X") == 2 && positions.count(' ') == 1
      next_move = brd.select { |k, v| combination.include?(k) && v == ' '  }.keys[0]
      #binding.pry
    end

  end
  next_move

end

def immediate_threat_or_win(brd)
  
  threat = nil
  check_for_threat= WINNG_COMBINATIONS.map do |combination|
    combination.map { |x| brd[x] }
  end

  check_for_threat.each_with_index do |x, i|
    if ( x.count('X') == 2 || x.count('O') ) == 2 && x.count(' ') == 1
      threat = WINNG_COMBINATIONS[i][x.index(' ')]
    end
  end

  p threat

end

def play_algorithm_one
    
  player_wins = 0
  computer_wins = 0

  loop do
    #break if !play?
    board = EMPTY_BOARD.clone

    loop do
      system 'clear'
      print_board(board, player_wins, computer_wins)
      user_move(board)
      computer_move(board)

      if winner?(board)
        system 'clear'
        puts "#{winner?(board)} won!"
        
        player_wins += 1 if winner?(board) == 'Player'
        computer_wins += 1 if winner?(board) == 'Computer'
        break
      end

      if tie?(board)
        system 'clear'
        puts "You tied!"

        break
      end

    end

    break if player_wins == 5 || computer_wins == 5
  end
end

def place_piece!(board, current_player)
  if current_player == 'Player' then user_move(board) else computer_move(board) end
end

def who_goes_first
  puts "Do you want to go first (Y/N)"
  input = gets.chomp.downcase
  if input == 'y' then return 'Player' else return 'Computer' end
end

def alternate_player(current_player)
  if current_player == 'Player' then return 'Computer' else return 'Player' end
end

def someone_won?(brd)

  if winner?(brd) then puts "#{winner?(brd)} won!"  end
  winner?(brd)
end

def play_algorithm_two

  player_wins = 0
  computer_wins = 0

  until player_wins == 5 || computer_wins == 5
    current_player = who_goes_first
    board = EMPTY_BOARD.clone
    loop do
      system 'clear'
      print_board(board, player_wins, computer_wins)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || tie?(board)
    end
    system 'clear'
    if winner?(board) == 'Player' then player_wins += 1; puts "Player wins" end
    if winner?(board) == 'Computer' then computer_wins += 1; puts "Computer wins" end
    if tie?(board) then puts "Tie!" end
    print_board(board, player_wins, computer_wins)
    if computer_wins < 5 && player_wins < 5 then puts "Let's play again." end
  end

end

play_algorithm_two