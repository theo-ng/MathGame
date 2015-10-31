require_relative 'player'
require_relative 'question'
require_relative 'state'
require_relative 'ui'
require_relative 'game'
require 'byebug'
require 'colorize'

class Main
  def run
    game = Game.new
    game.setup
  end
end

Main.new.run