require './classes/game'

puts "Emter Player 1's name: "
player1 = gets.chomp
puts "Enter Player 2's name: "
player2 = gets.chomp

puts "gl & hf!"
new_game = Game.new(player1, player2)
new_game.start