class State

  attr_reader :turn
  attr_reader :on
  attr_reader :start
  attr_reader :end
  alias :on? :on

  def initialize
    @turn = 0
    @on = true
    @start = Time.now
    @end = Time.now
  end

  def start_timer
    @start = Time.now
  end

  def stop_timer
    @end = Time.now
  end

  def switch_turn
    @turn = (@turn == 0) ? 1 : 0
    # case @turn
    # when 1 then @turn = 2
    # when 2 then @turn = 1
    # end
  end

  def off
    @on = false
  end
end