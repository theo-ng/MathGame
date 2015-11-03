class Player

  MAX_NAME_LENGTH = 7
  MAX = 10

  attr_reader :name
  attr_accessor :lives, :score, :won, :dead
  alias :won? :won
  alias :dead? :dead

  def initialize(name)
    @name = fix_name(name)
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

  def give_points(state)
    score = MAX - (state.end - state.start)
    self.score += [0, score.round].max
  end

  def fix_name(name)
    name.ljust(MAX_NAME_LENGTH, " ")
  end

  def wins
    @won = true
  end

  def reset
    self.lives = 3
    self.won = false
    self.dead = false
  end
end