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
  score = 10 - (@end - @start)
  case @turn
  when 1 then @p1_score += score.round
  when 2 then @p2_score += score.round
  end
end

def update(reply)
  if correct?(reply)
    give_points
  else
    kill_player
  end
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

def set_winner(dead_player)
  if @p2_score == @p1_score
    if @dead == @p1_name
      @winner = @p2_name
    else
      @winner = @p1_name
    end
  else
    @winner = @p2_score > @p1_score ? @p2_name : @p1_name
  end
end