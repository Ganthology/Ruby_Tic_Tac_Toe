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

class Player
  attr_reader :sign
  attr_accessor :name, :id
  @@id = 0

  def initialize(name, sign)
    @name = name
    @sign = sign
    @id = @@id
    @@id += 1
  end
end

module WinningConditions
  player1_win = false
  player2_win = false

  def horizontal(board, player1, player2)
    # board.any row.all?(same sign)
    board.each do |row|
      player1_win = true if row.all?(player1.sign)
      player2_win = true if row.all?(player2.sign)
    end
  end

  def vertical(board, player1, player2)
    board.transpose.each do |column|
      player1_win = true if column.all?(player1.sign)
      player2_win = true if column.all?(player2.sign)
  end

  def diagonal(board, player1, player2)
    diagonal = true if board[0][0] == board[1][1] == board[2][2]
    diagonal = true if board[0][2] == board[1][1] == board[2][0]
    player1_win = true if diagonal && board[1][1] == player1.sign
    player2_win = true if diagonal && board[1][1] == player2.sign
end

class TicTacToe
  include WinningConditions

  def initialize(player1 = Player.new('Player 1', 'O'), player2 = Player.new('Player 2', 'X'))
    @player1 = player1
    @player2 = player2
    @board = Board.new()
  end

  def game()
    # while not winning conditions && none?(" ")
    # receive input from players
    # turn by turn, display current board with signs on it

  end
end
game = Board.new()
game.display_board