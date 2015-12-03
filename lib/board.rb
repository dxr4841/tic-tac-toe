class Board
  attr_reader :grid
   class << self

    def create(args={})
      new(args)
    end

    private :new
  end

  def initialize(args={})
      @grid = args[:grid] || (0..8).to_a
      @grid[args[:index]] = args[:marker] if args[:marker] && args[:index]
  end
end