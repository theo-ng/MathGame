class UI

  def start_up_info
    info =  "---------------------\n"
    info << "Welcome to my 2 person math game.\n" 
    info << "The faster you answer the more points.\n" 
    info << "You have 3 lives."
    puts info
  end

  def get_name
    puts "Enter name of Player."
    name = gets.chomp[0,7].upcase
    raise EmptyNameError, "You have not entered a name" if name.empty?
    name
  end

  def ask_question(question)
    puts question
  end

  def get_reply
    reply = gets.chomp
    raise InvalidGuessError, "Invalid Response, please use numbers only" unless reply =~ /\d+/
    reply = reply.to_i
  end

  def display_score(player1, player2)
    puts ""
    puts ""
    puts "Player | Lives    | Scores"
    puts "------ |----------|-------"
    puts "#{player1.name}| #{player1.lives.to_s.colorize(:red)}        | #{player1.score.to_s.colorize(:green)}"
    puts "#{player2.name}| #{player2.lives.to_s.colorize(:red)}        | #{player2.score.to_s.colorize(:green)}"
  end 

  def end_screen(player1, player2)
    dead_player = player1.dead ? player1 : player2
    winner = player1.won ? player1 : player2
    puts "Game Over. #{dead_player.name} ran out of lives. #{winner.name.rstrip} Wins!"
    puts "Do you want to play again? y/n"
    gets.chomp
  end
end