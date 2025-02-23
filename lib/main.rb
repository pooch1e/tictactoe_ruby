#ruby tic tac toe
#what is the model?
#build board (view)
#build controller (players/turns)
#
#
#lets start with modules/functional

#refractor to classes
#Handle Game Board
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

  #attempt to refracture this
  def winner? 
    #check accross only
    @board.each do |row|
      if row.all? {|cell| cell == "X"}
        puts "Winning Combo"
        return true
      else
        puts "continue"
        return false
      end

      #check down?
      (0..2).each do |col|
        if @board.all? { |row| row[col] == "X"}
          puts "Winning Combo"
          return true
        else
          puts "Continue"
          return false
        end
      end

      #check diagonal?
      #check left to bottom right
      if @board[0][0] == "X" && @board[1][1] == "X" && @board[2][2] == "X" || @board[0][2] == "X" && @board[1][1] == "X" && @board[2][0] == "X" #top right to bottom left
        puts "Winning Combo"
        return true
      else
        return false
      end
    end
  end
end

#Handle Player
class Player
  def initialize() #x or o
  end

  def who_is_playing()
    puts "Who is playing?"
    symbol = gets.chomp
    symbol.to_s.upcase()
    puts "#{symbol} is player 1, 0 is player 2"
    return symbol
  end

  def player_choice()
    puts "Where do you want to play?"
    input1 = gets.chomp
    input2 = gets.chomp 
    #how to output this for the gameboard
    return input1, input2
  end
end


#Handle Game Logic
class GamePlay
  def initialize()
    @turn = 0
    @game_end = false
    puts "Begin the game!"
  end

  def who_move()
    puts "The turn is #{@turn}"
    if @turn == 0
      puts "X's move"
      @turn += 1
    elsif @turn % 2 == 1
      puts "0's move"
      @turn += 1
    end
  end
end




#test game loop (working so far)
# player1.who_is_playing?("x")
# input1, input2 = player1.player_choice()
# game.update_board("x", input1.to_i, input2.to_i)

# game.update_board("X", 0, 2) #symbol has to be upcase
# game.update_board("X", 0, 1)
# game.update_board("X", 2, 2)
# game.update_board("X", 1, 1)
# game.update_board("X", 2, 0)

game = Board.new
player1 = Player.new
new_game = GamePlay.new

# Start the game
symbol = player1.who_is_playing

# Game loop
while new_game.instance_variable_get(:@turn) < 10 && !game.winner?
  new_game.who_move
  game.print_board

  input1, input2 = player1.player_choice
  game.update_board(symbol, input1.to_i, input2.to_i)
  if symbol == "X"
    player1.who_is_playing == "0"
  else
    return symbol
  end
  game.print_board

  break if game.winner?
end

puts "Game Over"






