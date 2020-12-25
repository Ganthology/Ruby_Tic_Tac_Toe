# things needed:
# board/display
# players/input
# game/round/winning conditions

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
    return false if row >= 3 || column >= 3
    true
  end

  def occupied?(row, column)
    # assume the size is perfect square
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

class Player
  attr_reader :sign, :name, :id
  @@id = 0

  def initialize(name, sign)
    @name = name
    @sign = sign
    @id = @@id
    @@id += 1
  end
end

class TicTacToe
  attr_accessor :player1, :player2, :current_player
  def initialize
    @current_player = ' '
    @board = Board.new
  end

  def game
    # while not winning conditions && none?(" ")
    # receive input from players
    # turn by turn, display current board with signs on it
    puts "Enter Player 1's Name:"
    player1_name = gets.chomp
    puts 'Enter a single character as your sign:'
    player1_sign = gets.chomp

    puts "Enter Player 2's Name:"
    player2_name = gets.chomp
    puts 'Enter a single character as your sign:'
    player2_sign = gets.chomp

    @player1 = Player.new(player1_name, player1_sign)
    @player2 = Player.new(player2_name, player2_sign)

    until @board.win? || @board.tie?
      @current_player = @current_player != @player1 ? @player1 : @player2
      @board.display_board
      puts "It's #{current_player.name}'s turn!"
      puts 'Enter a the row and column with a space between...'
      coordinates = gets.chomp.split.map { |coor| coor.to_i }
      until @board.valid_coor?(coordinates[0], coordinates[1]) && !@board.occupied?(coordinates[0], coordinates[1])
        puts('Wrong format, please enter again...') if !@board.valid_coor?(coordinates[0], coordinates[1])
        puts('The place is occupied, please choose another place...') if @board.occupied?(coordinates[0], coordinates[1])
        coordinates = gets.chomp.split.map { |coor| coor.to_i }
      end
      @board.place(coordinates[0], coordinates[1], current_player.sign)
    end

    @board.display_board

    if @board.win?
      puts "#{@current_player.name} win the game!"
    else
      puts 'It\'s a Tie!'
    end
  end
end

game = TicTacToe.new
game.game
