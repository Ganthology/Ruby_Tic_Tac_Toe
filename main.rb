=begin
things needed:
board/display
players/input
game/round/winning conditions
=end

class Board
  attr_reader :board

  def initialize
    @board = new_board
  end

  def new_board
    Array.new(3, Array.new(3,' ')) 
  end

  def display_board
    @board.each { |row| p row}
  end
end

game = Board.new()
game.display_board