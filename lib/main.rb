#ruby tic tac toe
#what is the model?
#build board (view)
#build controller (players/turns)
#
#
#lets start with modules/functional
#

#prints board to CL
def display_board(board)
  board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
  puts " #{board[0]} | #{board[1]} | #{board[2]} " 
  # puts "-----------" 
  puts " #{board[3]} | #{board[4]} | #{board[5]} " 
  # puts "-----------" 
  puts " #{board[6]} | #{board[7]} | #{board[8]} " 

end

#helper method to convert input to index
def user_input_to_index(user_input)
  puts "Where do you want to play?" #won't need this when I can feed user input as argument
  user_input = gets #won't need this when I can feed user input as argument
  user_index = user_input.to_i - 1
  return user_index

end
# user_input_to_index("")
# 
def move(board, user_index, who_is_playing)
  board[user_index] = who_is_playing
  board
end
display_board(0)
