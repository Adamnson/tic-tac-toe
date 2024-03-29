=begin
  how it should look:
  - a grid is displayed and the user is prompted to choose 
    a position to mark
  - check if marking the position is valid 
     -- yes: mark the position, check if player won
        --- yes: display grid, congratulations
        ---  no: computer moves, check if computer won
            ---- yes: better luck next time
            ----  no: display grid, ask user for input
     --  no: ask user to make a different choice

  make a game class
   - each new grid would be a new instance of the game class
   - the game class will have the following methods:
    -- draw_grid
    -- valid_pos?
    -- add_mark
    -- won?

  make a player class
   - player gets to choose between "x" and 0
     -- if player chooses x, display vanilla grid, ask for position
        then computer makes a choice and passes back to player
        repeat until winner emerges
     -- if player chooses 0, computer makes a choice, display grid, 
        ask for position
        repeat until winner emerges
   - after the game is over, ask if player wants to play again
     -- yes: repeat
     --  no: thank you for playing    

=end

#NOTE: index of arr = pos - 1
require 'pry-byebug'



#*******************************************
# CONSTANTS
#*******************************************

LINES = [[1,2,3], [4,5,6], [7,8,9], 
         [1,4,7], [2,5,8], [3,6,9], 
         [1,5,9], [3,5,7]]
VALID_X = ['X', 'x', '*']
VALID_O = ['O', 'o', '0']

#*******************************************
# CLASS DEFINITIONS
#*******************************************
class Game
  attr_reader :arr

  def initialize(arr) 
    @arr = arr
  end

  # private  
    def draw_grid()
        @arr.each_with_index do |i, id|
            print " #{i} "
            print "|" if ( ((id+1) % 3) > 0)
            puts "\n---+---+---" if ( (id!=8) && (((id+1)%3) == 0) ) 
        end
        puts "\n"
    end

    def valid_pos?(pos)
      if ( (@arr[pos-1] != 'X') and (@arr[pos-1] != 0) )
        return true
      end
      false
    end

    def won?(sign)
      LINES.any? do |line| 
      line.all? {|pos| @arr[pos-1] == sign}
      end
    end 

    def add_mark(player, pos)
      if valid_pos?(pos)
        @arr[pos-1] = player.sign
      else
         puts "Position choice invalid"
      end
    end

end
#*******************************************
class Player
  attr_accessor :sign, :is_computer

    def initialize(sign)
      @sign = sign
    end
end

#*******************************************
# main()
#*******************************************

vanilla = Game.new([1,2,3,4,5,6,7,8,9])
row1x   = Game.new(['X','X','X',4,5,6,7,8,9])
row2x   = Game.new([1,2,3,'X','X','X',7,8,9])
row3x   = Game.new([1,2,3,4,5,6,'X','X','X'])
row10   = Game.new([0,0,0,4,5,6,7,8,9])
row20   = Game.new([1,2,3,0,0,0,7,8,9])
row30   = Game.new([1,2,3,4,5,6,0,0,0])
col10   = Game.new([0,2,3,0,5,6,0,8,9])
dig10   = Game.new([0,2,3,4,0,6,7,8,0])
dig20   = Game.new([1,2,0,4,0,6,0,8,9])

player1 = Player.new("x")
player2 = Player.new(0)

=begin

vanilla = Game.new([1,2,3,4,5,6,7,8,9])
row1x   = Game.new(['X','X','X',4,5,6,7,8,9])
row2x   = Game.new([1,2,3,'X','X','X',7,8,9])
row3x   = Game.new([1,2,3,4,5,6,'X','X','X'])
row10   = Game.new([0,0,0,4,5,6,7,8,9])
row20   = Game.new([1,2,3,0,0,0,7,8,9])
row30   = Game.new([1,2,3,4,5,6,0,0,0])
col10   = Game.new([0,2,3,0,5,6,0,8,9])
dig10   = Game.new([0,2,3,4,0,6,7,8,0])
dig20   = Game.new([1,2,0,4,0,6,0,8,9])

games = [vanilla, row1x, row2x, row3x, row10, row20, row30, col10, dig10, dig20]

games.each do |game|
  puts "New game #{game}"
  game.draw_grid()
  # binding.pry
  p "X1: #{game.won?('X')}"
  p "o1: #{game.won?(0)}"
end

=end