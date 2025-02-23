#ruby tic tac toe
#what is the model?
#build board (view)
#build controller (players/turns)
#
#
#lets start with modules/functional

#refractor to classes

class Board
  def initialize(board = Array.new(3) {Array.new(3, " ")})
    @board = board
    
  end

  def print_board()
    puts " #{@board[0]}"
    puts " #{@board[1]}"
    puts " #{@board[2]}"
  end

  def update_board(player, x, y) #will be X or 0 for player, str input - x/y is coords for array
    if valid_move?(x, y) #check if space is empty
      @board[x][y] = player
    end
  end

  def valid_move?(x, y)
    @board[x][y] == " "

  end

  def winner?
    #check board state for all rows + collumns - returns true if win conditions  met
    if @board[0][0] == player && @board[0][1] == player && @board[0][2] == player ||
      @board[1][0] == player && @board[1][1] == player && @board[1][2] == player ||
      @board[2][0] == player && @board[2][1] == player && @board[2][2] == player
      puts "You Win!"
      return true
    end
  end
end

class Player
  def initialize() #x or o
  end

  def who_is_playing?(symbol)
    @symbol = symbol
    symbol.upcase()
    puts "#{symbol} is player 1, 0 is player 2"
  end

  def player_choice()
    puts "Where do you want to play?"
    input1 = gets.chomp
    input2 = gets.chomp 
    #how to output this for the gameboard
    return input1, input2
  end
end




  

game = Board.new
player1 = Player.new
player1.who_is_playing?("x")

player1.player_choice()
update_board("x", input1, input2)
game.print_board






