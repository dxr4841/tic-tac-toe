class Board
  attr_reader :grid
   class << self

    def start
      new
    end

    def create(args={})
      new(args)
    end

    private :new
  end

  def initialize(args={})
      @grid = args[:grid] || (0..8).to_a
      @grid[args[:index]] = args[:marker] if args[:marker] && args[:index]
  end

  def mark(marker, index)
    if !marker.is_a?(String)
        raise 'Marker is not a string'
    elsif marker.length != 1
        raise 'Marker has to be 1 character'
    else
      Board.create({marker: marker, index: index, grid: grid})
    end
  end

  def available_spots
    grid.select {|spot| spot.is_a?Integer}
  end
   def turn
    if available_spots.length.odd?
      1
    else
      2
    end
   end
  def is_available?(index)
    grid[index].is_a?(Integer)
  end

  def win?
    [grid[0], grid[1], grid[2]].uniq.length == 1 ||
    [grid[3], grid[4], grid[5]].uniq.length == 1 ||
    [grid[6], grid[7], grid[8]].uniq.length == 1 ||
    [grid[0], grid[3], grid[6]].uniq.length == 1 ||
    [grid[1], grid[4], grid[7]].uniq.length == 1 ||
    [grid[2], grid[5], grid[8]].uniq.length == 1 ||
    [grid[0], grid[4], grid[8]].uniq.length == 1 ||
    [grid[2], grid[4], grid[6]].uniq.length == 1
  end

  def tie?
    available_spots == []
  end

  def over?
    win? || tie?
  end

  def first_turn?
    available_spots.length == 9
  end
  def last_turn?
    available_spots.length == 1
  end
   def to_s
    "|_#{grid[0]}_|_#{grid[1]}_|_#{grid[2]}_|\n|_#{grid[3]}_|_#{grid[4]}_|_#{grid[5]}_|\n|_#{grid[6]}_|_#{grid[7]}_|_#{grid[8]}_|\n"
  end
end