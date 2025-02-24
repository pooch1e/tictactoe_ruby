
#Handle Game Board
class Board
  def initialize(board = Array.new(3) {Array.new(3, " ")})
    @board = board
    
  end

  def print_board()
    puts "  0   1   2 "
    puts "0 #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} "
    puts " ---+---+---"
    puts "1 #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} "
    puts " ---+---+---"
    puts "2 #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} "
  end

  def update_board(player, x, y) #will be X or 0 for player, str input - x/y is coords for array
    if valid_move?(x, y) #check if space is empty
      @board[x][y] = player
    else
      puts "Already filled, try again"
    end
  
  end

  def valid_move?(x, y)
    @board[x][y] == " "

  end

#new def winner?
def winner?
  # Check rows
  @board.each do |row|
    return true if row.uniq.length == 1 && row.first != " "
  end

  # Check columns
  (0..2).each do |col|
    return true if @board.all? { |row| row[col] == @board[0][col] } && @board[0][col] != " "
  end

  # Check diagonals
  return true if [@board[0][0], @board[1][1], @board[2][2]].uniq.length == 1 && @board[1][1] != " "
  return true if [@board[0][2], @board[1][1], @board[2][0]].uniq.length == 1 && @board[1][1] != " "

  false
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
    puts "You are #{symbol}"
    return symbol
  end

  def player_choice()
    loop do
      puts "Enter row (0-2):"
      x = gets.chomp.to_i
      puts "Enter column (0-2):"
      y = gets.chomp.to_i
      return x, y if x.between?(0, 2) && y.between?(0, 2)
  
      puts "Invalid input. Please enter numbers between 0 and 2."
    end
  end
end



#Handle Game Logic
class GamePlay
  def initialize
    @turn = 0
    @x_turn = true
    puts "Begin the game!"
  end

  def who_move
    puts "The turn is #{@turn}"
    player = @x_turn ? "X" : "O"
    puts "It's #{player}'s turn"
    @x_turn = !@x_turn
    @turn += 1
    player
  end
end


game = Board.new
player1 = Player.new
new_game = GamePlay.new

# Start the game
symbol = player1.who_is_playing


# Game loop
while !game.winner? && new_game.instance_variable_get(:@turn) < 9
  symbol = new_game.who_move
  game.print_board

  x, y = player1.player_choice
  until game.valid_move?(x, y)
    puts "Invalid move, try again."
    x, y = player1.player_choice
  end
  game.update_board(symbol, x, y)

  break if game.winner?
end

puts "Game Over, #{symbol} won"
game.print_board
