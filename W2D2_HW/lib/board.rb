class Board
  attr_accessor :cups 
  attr_reader :name1, :name2
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
    
    i = start_pos 
    while stones > 0
      i += 1
      i %= 14
      if current_player_name == @name1
        unless i == 13
         @cups[i] << :stone
          stones -= 1
        end
      elsif current_player_name == @name2
        unless i == 6
         @cups[i] << :stone
          stones -= 1
        end
      end
    end
    self.render
    self.next_turn(i)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 13 || ending_cup_idx == 6
      return :prompt
    elsif @cups[ending_cup_idx].count == 1
      return :switch
    elsif @cups[ending_cup_idx].count > 1
      return ending_cup_idx
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
    if @cups[6].length == @cups[13].length
      return :draw
    elsif @cups[6].length > @cups[13].length
      return @name1
    elsif @cups[13].length > @cups[13].length
      return @name2
    end
  end
end
