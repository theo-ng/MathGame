def generate_question
  randomize = Random.new
  @num1 = randomize.rand(1..20)
  @num2 = randomize.rand(1..20)
  @question = randomize.rand(0..2)
end

def kill_player
  case @turn
  when 1 then @p1_lives -= 1
  when 2 then @p2_lives -= 1
  end
end

def give_points
  score = MAX - (@end - @start)
  case @turn
  when 1 then @p1_score += score.round
  when 2 then @p2_score += score.round
  end
end

def update(reply)
  correct?(reply) ? give_points : kill_player
end

def correct?(ans)
  case @question
  when 0 then ans == @num1 + @num2
  when 1 then ans == @num1 - @num2
  when 2 then ans == @num1 * @num2
  end
end

def switch_turn
  case @turn
  when 1 then @turn = 2
  when 2 then @turn = 1
  end
end

def fix_name(name)
  length = name.length
  (7 - length).times { name << ' '}
end

def set_dead
  @dead = @p1_lives == 0 ? @p1_name : @p2_name
  set_winner(@dead)
end

def tie?
  @p2_score == @p1_score
end

def set_winner(dead_player)
  if tie? && @dead == @p1_name
    @winner = @p2_name
  elsif tie? && @dead == @p2_name
    @winner = @p1_name
  elsif @p2_score > @p1_score
    @winner = @p2_name
  else
    @winner = @p1_name
  end
end