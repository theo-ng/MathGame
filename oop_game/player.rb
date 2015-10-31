class Player

  MAX_NAME_LENGTH = 7

  attr_reader :name
  attr_accessor :lives
  attr_accessor :score
  attr_accessor :won
  attr_accessor :dead
  alias :won? :won
  alias :dead? :dead

  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
    @won = false
    @dead = false
  end

  def kill
    self.lives = lives - 1
    dies if lives == 0
  end

  def dies
    # byebug
    @dead = true
  end

  def give_points
    self.score = score + 1
  end

  def fix_name
    @name = @name.ljust(7, " ")
  end

  def wins
    @won = true
  end
end