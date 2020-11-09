require 'pry'

DECK = {
          'AH' => 11, 'AD' => 11, 'AC' => 11, 'AS' => 11,
          '2H' => 2, '2D' => 2, '2C' => 2, '2S' => 2,
          '3H' => 3, '3D' => 3, '3C' => 3, '3S' => 3,
          '4H' => 4, '4D' => 4, '4C' => 4, '4S' => 4,
          '5H' => 5, '5D' => 5, '5C' => 5, '5S' => 5,
          '6H' => 6, '6D' => 6, '6C' => 6, '6S' => 6,
          '7H' => 7, '7D' => 7, '7C' => 7, '7S' => 7,
          '8H' => 8, '8D' => 8, '8C' => 8, '8S' => 8,
          '9H' => 9, '9D' => 9, '9C' => 9, '9S' => 9,
          '10H' => 10, '10D' => 10, '10C' => 10, '10S' => 10,
          'JH' => 10, 'JD' => 10, 'JC' => 10, 'JS' => 10,
          'QH' => 10, 'QD' => 10, 'QC' => 10, 'QS' => 10,
          'KH' => 10, 'KD' => 10, 'KC' => 10, 'KS' => 10,
       }

MAXIMUM = 21

def shuffle_cards
  DECK.keys.shuffle
end

def deal_card(cards, hand)
  hand << cards.pop
end

def initial_deal(cards, player, computer)
  deal_card(cards, player)
  deal_card(cards, player)
  deal_card(cards, computer)
  deal_card(cards, computer)
end

def display_cards(player, computer)
  system 'clear'
  puts
  print "Dealer: [??]"
  computer[1..].each { |card| print '[' + card + ']' }
  puts
  print "Player: "
  player.each { |card| print '[' + card + ']' }
  print "  #{count_points(player)} points"
end

def display_cards_at_end(player, computer)
  system 'clear'
  puts
  print "Dealer: "
  computer.each { |card| print '[' + card + ']' }
  print "  #{count_points(computer)} points"
  puts
  print "Player: "
  player.each { |card| print '[' + card + ']' }
  print "  #{count_points(player)} points"
end

def count_points(hand)
  total = DECK.slice(*hand).values.sum
  adjust_for_aces(hand, total)
end

def adjust_for_aces(hand, total)
  ace_count = hand.select{ |card| card == ('AH' || 'AD' || 'AC' || 'AS') }.size
  ace_count.times do
    if total > MAXIMUM then total -= 10 end
  end
  total
end

def user_hit?
  puts
  puts "Hit or Stay?  (H or S)"
  input = gets.chomp.downcase
  return true if input == 'h'
end

def computer_hit?(player_hand, computer_hand)
  true if count_points(player_hand) > count_points(computer_hand)
end

def bust?(hand)
  count_points(hand) > MAXIMUM
end

def evaluate_game(player_hand, computer_hand)
  if bust?(player_hand) 
    puts "You went bust!  You lose!"
  elsif bust?(computer_hand)
    puts "Computer went bust!  You win!"
  elsif count_points(player_hand) == count_points(computer_hand)
    puts "Tie!"
  elsif count_points(player_hand) > count_points(computer_hand)
    puts "You win!"
  else count_points(player_hand) < count_points(computer_hand)
    puts "You lose!"
  end
end


player_hand = []
computer_hand = []

shuffled_cards = shuffle_cards
initial_deal(shuffled_cards, player_hand, computer_hand)

loop do
  system 'clear'
  display_cards(player_hand, computer_hand)
  if user_hit? and not bust?(player_hand)
    deal_card(shuffled_cards, player_hand)
  else
    break
  end
end

loop do
  if computer_hit?(player_hand, computer_hand) and not bust?(player_hand) and not bust?(computer_hand)
    deal_card(shuffled_cards, computer_hand)
  else
    break
  end
end

system 'clear'
display_cards_at_end(player_hand, computer_hand)
puts
evaluate_game(player_hand, computer_hand)
