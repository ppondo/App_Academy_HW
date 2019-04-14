class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over == true
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn(*args)
    self.show_sequence
    self.require_sequence
    if @game_over == false
      self.round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
  end

  def require_sequence
    guess = gets.chomp
    
    puts "please repeat the sequence just shown:"
    guess
    if !@seq.include?(guess)
      @game_over = true
      return false
    end

    true
  end

  def add_random_color
    colors = ["red", "blue", "yellow", "green"]
    rand_color = colors[rand(0..3)] 
    @seq << rand_color 
  end

  def round_success_message(*args)
    puts "round success!"
  end

  def game_over_message 
    puts "Game Over!!"
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end
