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

  private
  def best_choice(board)
    if board.first_turn?
      first_move
    elsif board.last_turn?
      board.available_spot.pop
    else
      best_move(board)
    end
  end
  def first_move
    [0,2,6,8].sample
  end

  def best_move(board)
    minmax(board)
    choice
  end
   def minmax(board, depth =0)
    return score(board, depth) if board.over?

    depth++
    scores = []
    moves = []

    board.available_spots.each do |move|
      if my_turn?(board.turn)
        scores.push minmax(board.mark(marker, move), depth)
      else
        scores.push scores.push minmax(board.mark(marker, move), depth)
      end
      moves.push(move)
    end

    if my_turn?(board.turn)
      max_score_index = scores.each_with_index.max[1]
      @choice = moves[max_score_index]
      return scores[max_score_index]
    else
    min_score_index = scores.each_with_index.min[1]
    @choice = moves[min_score_index]
    return scores[min_score_index]
    end
  end

  def score(board, depth =0)
    if winner?(board)
      10 - depth
    elsif loser?(board)
      depth - 10
    else
      0
    end
  end

   def my_turn?(board)
    board.turn ==
  end

  def winner?(board)
    [board.grid[0], board.grid[1], board.grid[2]] == winning_grid ||
    [board.grid[3], board.grid[4], board.grid[5]] == winning_grid ||
    [board.grid[6], board.grid[7], board.grid[8]] == winning_grid ||
    [board.grid[0], board.grid[3], board.grid[6]] == winning_grid ||
    [board.grid[1], board.grid[4], board.grid[7]] == winning_grid ||
    [board.grid[2], board.grid[5], board.grid[8]] == winning_grid ||
    [board.grid[0], board.grid[4], board.grid[8]] == winning_grid ||
    [board.grid[2], board.grid[4], board.grid[6]] == winning_grid
  end

  def loser?(board)
    [board.grid[0], board.grid[1], board.grid[2]] == losing_grid ||
    [board.grid[3], board.grid[4], board.grid[5]] == losing_grid ||
    [board.grid[6], board.grid[7], board.grid[8]] == losing_grid ||
    [board.grid[0], board.grid[3], board.grid[6]] == losing_grid ||
    [board.grid[1], board.grid[4], board.grid[7]] == losing_grid ||
    [board.grid[2], board.grid[5], board.grid[8]] == losing_grid ||
    [board.grid[0], board.grid[4], board.grid[8]] == losing_grid ||
    [board.grid[2], board.grid[4], board.grid[6]] == losing_grid
  end

  def winning_grid
    (marker * 3).split("")
  end

  def losing_grid
    (opp_marker * 3).split("")
  end
end