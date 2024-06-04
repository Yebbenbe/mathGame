require_relative 'question'
require_relative 'player'

class Game
  include Question

  def initialize(player1, player2)
    @player_one = Player.new(player1)
    @player_two = Player.new(player2)
    @current_player = @player_one
    @question_number = 1
    @answer = 0
  end

  def start
    puts "--- Begin! ---"
    puts "--- #{@player_one} & #{@player_two} ---\n\n"

    20.times do
      break if game_over?

      ask_question
      switch_player
    end

    declare_winner
  end

  def ask_question
    question, @answer = generate_question
    puts "Question ##{@question_number}:"
    puts "#{@current_player}, #{question}"
    input = get_input
    check_answer(input)
  end

  def generate_question
    case rand(1..4)
    when 1 then addition
    when 2 then subtraction
    when 3 then multiplication
    when 4 then division
    end
  end

  def get_input
    print "Your answer is: "
    input = gets.chomp
    if input.match?(/\A-?\d+\z/)
      input.to_i
    else
      puts "Please enter a number."
      get_input
    end
  end

  def check_answer(input)
    if @answer == input
      puts "YES! You got it right."
      @current_player.increment_score
    else
      puts "Nope! The correct answer was #{@answer}."
      @current_player.lose_life
      puts "--- #{@player_one}: #{@player_one.life}/3 vs #{@player_two}: #{@player_two.life}/3 ---"
    end
    puts "#{@current_player}'s score: #{@current_player.score}\n\n"
    @question_number += 1
  end

  def switch_player
    @current_player = (@current_player == @player_one) ? @player_two : @player_one
  end

  def game_over?
    @player_one.life.zero? || @player_two.life.zero? || @question_number > 20
  end

  def declare_winner
    winner = (@player_one.score > @player_two.score) ? @player_one : @player_two
    puts "#{winner} Wins!"
  end
end