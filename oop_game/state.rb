class State

  attr_reader :turn
  attr_reader :on
  attr_accessor :start
  attr_accessor :end
  alias :on? :on

  def initialize
    @turn = 1
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
    case @turn
    when 1 then @turn = 2
    when 2 then @turn = 1
    end
  end

  def off
    @on = false
  end
end