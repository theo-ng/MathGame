require_relative 'player'
require_relative 'question'
require_relative 'state'
require_relative 'ui'
require_relative 'game'
require_relative 'invalid_guess_error'
require_relative 'empty_name_error'
require 'byebug'
require 'colorize'

class Main
  def run
    puts 'v2'
    game = Game.new
    game.setup
  end
end

Main.new.run