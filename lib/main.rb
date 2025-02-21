#ruby tic tac toe
#what is the model?
#build board (view)
#build controller (players/turns)
#
#
#lets start with modules/functional
#

#prints board to CL
def display_board()
  board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  puts " #{board[0]} | #{board[1]} | #{board[2]} " 
  puts "-----------" 
  puts " #{board[3]} | #{board[4]} | #{board[5]} " 
  puts "-----------" 
  puts " #{board[6]} | #{board[7]} | #{board[8]} " 

end

def player_move()
  puts "Enter a number between 1-9 to make your move"
  move = gets.chomp
  index = move.to_i - 1
  return index
end

def make_move(index)
  board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  board[index] = "X"
  return board
end



#refractor to classes

class Board
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
    
  end

  def print_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} " 
    puts "-----------" 
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} " 
    puts "-----------" 
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
  end

  def board_update(player_move)
    @board[player_move] = "X"
    print_board
  end
end

class Player
  def initialize(playerX)
    @playerX = playerX
    
  end

  def player_move()
    puts "Enter a number between 1-9 to make your move"
    move = gets.chomp
    index = move.to_i - 1
    return index
  end
end



