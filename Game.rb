require_relative "Card.rb"
require_relative "Board.rb"

# play loop runs

# Inside the play loop method
# 1) Render Board
# 2) Get input from player
# 3) Reveal position 
#    Turn counter = 1
#    
#    Turn counter = 2
#    if turn-counter && 2nd revealed position == previous position, don't hide board
# 4) Check if all cards are revealed?
# 5) If all positions are revealed, player wins, if not do nothing
# 6) Repopulate board again, and hide

class Game

  def initialize
    @board = Board.new()
    @game_over = false
    @guess_one = nil
    @guess_two = nil
    @turn_counter = 1
  end

  def play
    while !game_over
      self.get_user_input
      self.check_positions
      game_over = true if @board.board_full?
    end
  end

  def get_user_input
    puts "Please enter the position of the card you'd like to flip: (e.g. "2,3")"
    user_input = gets.chomp.split(",")
    turn_counter += 1
    
    if turn_counter == 1
      @guess_one == user_input
    elsif turn_counter == 2
      @guess_two == user_input
      turn_counter = 0
    end
  end

  def check_positions
    if turn_counter == 1
      @board.reveal(guess_one)
    elsif turn_counter == 2
      @board.reveal(guess_two)
      if @guess_one != @guess_two
        puts "Try again!"
        sleep(2)
        system("clear")
      else
        puts "Its a match!"
      end
    end
  end

end