# things needed:
# board/display
# players/input
# game/round/winning conditions



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
