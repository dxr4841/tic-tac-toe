class Board
  attr_reader :grid

  def initialize(args={})
      @grid = args[:grid] || (0..8).to_a
      @grid[args[:index]] = args[:marker] if args[:marker] && args[:index]
  end
end