class Game
  def initialize
    @ui = UI.new
    @state = State.new
    @players = []
  end

  def correct?(question, reply)
    question.answer == reply
  end

  def update(question, reply, player, state)
    correct?(question, reply) ? player.give_points(state) : player.kill
  end

  def progress(player)
    # Make a question
    question = Question.new
    # Send a question
    @ui.ask_question(question.format(player))
    @state.start_timer
    # Get reply
    begin
      reply = @ui.get_reply
    rescue InvalidGuessError => e
      puts e
      reply = @ui.get_reply
    end
    @state.stop_timer
    # Do stuff with reply
    update(question, reply, player, @state)
    @state.switch_turn
  end

  def tie?(player1, player2)
    player1.score == player2.score
  end

  def tiebreak(player1, player2)
    player2.dead? ? player1.wins : player2.wins
  end

  def find_winner(player1, player2)
    if tie?(player1, player2)
      tiebreak(player1, player2) 
    else
      player1.score > player2.score ? player1.wins : player2.wins
    end
  end

  def replay?(string)
    true if string == 'y' ? true : false
  end

  def reset(player1, player2)
    player1.reset
    player2.reset
    @state = State.new
  end

  def continue(player1, player2)
    reset(player1, player2)
    # byebug
    play(player1, player2)
  end

  def setup
    @ui.start_up_info
    2.times do 
      @players << Player.new(get_player)
    end
    # byebug
    play(@players[0], @players[1])
  end

  def get_player
    begin
      name = @ui.get_name
    rescue EmptyNameError => e
      puts e
      get_player
    end
  end

  def play(player1, player2)
    while @state.on?
      @state.turn == 0 ? progress(player1) : progress(player2)
      # Show scores
      @ui.display_score(player1, player2)
      # Check for death
      @state.off if player1.lives == 0 || player2.lives == 0
    end
    find_winner(player1, player2)
    replay = @ui.end_screen(player1, player2)
    continue(player1, player2) if replay?(replay)
  end
end