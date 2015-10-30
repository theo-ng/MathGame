require 'byebug'
require 'colorize'
require_relative 'logic.rb'
require_relative 'data.rb'

def init
  puts "---------------------"
  puts "Welcome to my 2 person math game." 
  puts "The faster you answer the more points." 
  puts "You have 3 lives."
  puts "Enter name of Player 1."
  @p1_name = gets.chomp[0,7].upcase
  fix_name(@p1_name)
  puts "Enter name of Player 2."
  @p2_name = gets.chomp[0,7].upcase
  fix_name(@p2_name)
end

def repl
  # byebug
  while(@p1_lives > 0 && @p2_lives > 0)
    generate_question
    puts "#{@p1_name}: What does #{@num1} #{@type[@question]} #{@num2} equal?" if @turn == 1
    puts "#{@p2_name}: What does #{@num1} #{@type[@question]} #{@num2} equal?" if @turn == 2
    @start = Time.now
    reply = gets.chomp.to_i
    @end = Time.now
    update(reply)
    switch_turn
    puts ""
    puts ""
    puts "Player | Lives    | Scores"
    puts "------ |----------|-------"
    puts "#{@p1_name}| #{@p1_lives.to_s.colorize(:red)}        | #{@p1_score.to_s.colorize(:green)}"
    puts "#{@p2_name}| #{@p2_lives.to_s.colorize(:red)}        | #{@p2_score.to_s.colorize(:green)}"
  end
  set_dead
  puts "Game Over. #{@dead.rstrip} ran out of lives. #{@winner.rstrip} Wins!"
  puts "Do you want to play again? y/n"
  replay = gets.chomp
  if replay == 'y'
    @p1_lives = 3
    @p2_lives = 3
    @turn = 2
    repl
  end
end

init
repl