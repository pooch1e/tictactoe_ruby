#ruby tic tac toe
#what is the model?
#build board (view)
#build controller (players/turns)
#
#
#lets start with modules/functional
#
def create_board()
  board = []
  row = ["   " "|" "   " "|" "   "]
  seperator = "---------------"
  board.push(row)
  board.push(seperator)
  board.push(row)
  board.push(seperator)
  board.push(row)
  p board
 
end
create_board()
#print board to console with lines
def print_board(create_board)
  
end