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

  def is_available?(index)
    grid[index].is_a?(Integer)
  end

end