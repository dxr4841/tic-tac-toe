require_relative('board')

describe Board do
  describe '#start' do
    let(:myBoard) {Board.start}
    it 'creates are starting board for tic-tac-toe' do
      expect(myBoard.grid).to eq((0..8).to_a)
    end
  end
  describe '#create' do
    let(:myBoard) {Board.create({grid:[0,"X",2,3,4,5,6,7,8]})}
    it 'creates a board with a specific grid' do
      expect(myBoard.grid).to eq([0,"X",2,3,4,5,6,7,8])
    end
  end
  describe '#mark' do
    let(:myBoard) {Board.start}
    it 'Returns a Board object' do
      expect(myBoard.mark("O",4).is_a? Board).to eq(true)
    end

    it 'Returns a board with marker in the grid at the index given' do
        expect(myBoard.mark("O",4).grid).to eq(Board.create({grid:[0,1,2,3,"O",5,6,7,8]}).grid)
    end
  end

  describe '#available_spots' do
    it ' For Board.start available_spots should return an array eq to the grid'do
      expect(Board.start.available_spots).to eq(Board.start.grid)
    end

    it'should return an empty array'do
      expect(Board.create({grid: ["X","O","O","X","O","O""X","O","O"]}).available_spots).to eq([])
    end
  end

   describe '#win?' do
    it 'Should return false when it is not a game winning board'do
      expect(Board.create({grid:[0,1,2,3,"O",5,6,7,8]}).win?).to eq(false)
    end

    it'Should return true when it is a game winning board'do
      expect(Board.create({grid: ["X","X","X","O","O",5,6,7,8]}).win?).to eq(true)
    end
  end
end