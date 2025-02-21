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
  def initialize(player, symbol)
    @player = player
    @symbol = symbol
  end

end


game = Board.new
game.print_board


