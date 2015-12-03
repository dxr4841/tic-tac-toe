class Player
  attr_reader :name, :marker
  def initialize(args = {})
     @name = args[:name] || "Player"
     @marker = args[:marker] || "O"

  end
end

class Human < Player
  def initialize(args = {})
    super(name)
    super(marker)
  end
end

class Cpu < Player
    attr_reader :name, :marker, :opp_marker, :choice
    attr_accessor :turn,
  def initialize(args = {})
    @name = args[:name] || "CPU"
    @marker = args[:marker] || "X"
    @choice = nil
    @turn = nil
  end

  def select_spot(board)

    best_choice(board)
  end
end