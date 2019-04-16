class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    self.place_stones
  end
  
  def place_stones
    @cups.each_index do |i|
      4.times { @cups[i] << :stone } unless i == 6 || i == 13
    end
  end

  def valid_move?(start_pos)
    unless [0..13].include?(start_pos)
      raise "Invalid starting cup" 
    end

    if @cups[start_pos].empty?
      raise "Starting cup is empty" 
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].length
    @cups[start_pos] = []
    
    i = start_pos + 1
    stones.times do
      @cups[i%14] << :stone 
      i += 1
    end

    self.render
  end

  def next_turn(ending_cup_idx)
    if @cups[ending_cup_idx].empty? 
      return :switch
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    one = (0..5).all? { |idx| @cups[idx].empty? } 
    two = (7..12).all? { |idx| @cups[idx].empty? }

   

    if one == false && two == false
      return false
    else
      return true      
    end
    
  end

  def winner
    if @cups[6] == @cups[13]
      return :draw
    end
  end
end
