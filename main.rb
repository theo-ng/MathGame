require 'byebug'
require 'colorize'
require_relative 'logic.rb'
require_relative 'data.rb'

def startup_info
  info =  "---------------------\n"
  info << "Welcome to my 2 person math game.\n" 
  info << "The faster you answer the more points.\n" 
  info << "You have 3 lives."
  info
end

def get_names
  puts "Enter name of Player 1."

  @p1_name = gets.chomp[0,7].upcase
  fix_name(@p1_name)

  puts "Enter name of Player 2."

  @p2_name = gets.chomp[0,7].upcase
  fix_name(@p2_name)
end

def ask_question
    puts @turn == 1 ? "#{@p1_name}: What does #{@num1} #{@type[@question]} #{@num2} equal?" : "#{@p2_name}: What does #{@num1} #{@type[@question]} #{@num2} equal?"
    start_timer
end

def start_timer
  @start = Time.now
end

def stop_timer
  @end = Time.now
end

def display_score
  puts ""
  puts ""
  puts "Player | Lives    | Scores"
  puts "------ |----------|-------"
  puts "#{@p1_name}| #{@p1_lives.to_s.colorize(:red)}        | #{@p1_score.to_s.colorize(:green)}"
  puts "#{@p2_name}| #{@p2_lives.to_s.colorize(:red)}        | #{@p2_score.to_s.colorize(:green)}"
end

def end_screen
  set_dead
  puts "Game Over. #{@dead.rstrip} ran out of lives. #{@winner.rstrip} Wins!"
  puts "Do you want to play again? y/n"
  replay = gets.chomp
  replay if replay?(replay)
end

def replay?(string)
  false
  true if string == 'y'
end

def replay
  @p1_lives = 3
  @p2_lives = 3
  @turn = 2
  repl
end

def repl
  # byebug
  while(@p1_lives > 0 && @p2_lives > 0)
    generate_question
    ask_question

    reply = gets.chomp.to_i
    stop_timer

    # do stuff with reply
    # get ready for new question
    update(reply)
    display_score
    switch_turn
  end
  end_screen
end

def new_game
  puts startup_info
  get_names
  repl
end

new_game