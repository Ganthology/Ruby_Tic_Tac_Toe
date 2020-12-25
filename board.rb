class Board
  attr_reader :board

  def initialize
    @board = new_board
  end

  def new_board
    @board = Array.new(3) { Array.new(3, '_') }
  end

  def display_board
    puts '  0  1  2'
    @board.each_with_index { |row, index| puts "#{index} #{row.join('  ')}" }
  end

  def place(row, column, sign)
    @board[row][column] = sign
  end

  def valid_coor?(row, column)
    # assume the size is perfect square
    return false if row.nil? || column.nil?

    return false if row >= 3 || column >= 3

    true
  end

  def occupied?(row, column)
    # assume the size is perfect square
    return false if row.nil? || column.nil?

    return false if row >= 3 || column >= 3

    return true if @board[row][column] != '_'

    false
  end

  def win?
    board.each do |row|
      return true if row.all?(row[0]) && row.none?('_')
    end
    board.transpose.each do |column|
      return true if column.all?(column[0]) && column.none?('_')
    end
    diagonal = true if board[0][0] != '_' && board[0][0] == board[1][1] && board[1][1] == board[2][2]
    diagonal = true if board[0][0] != '_' && board[0][2] == board[1][1] && board[1][1] == board[2][0]
    return true if diagonal && board[1][1] != '_'

    false
  end

  def tie?
    # check if contains any '_'
    # if not contains any then the board is full = tie game
    board.each do |row|
      return false if row.any?('_')
    end
    true
  end
end
