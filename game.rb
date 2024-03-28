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


    vanilla = [1, 2, 3, 
               4, 5, 6, 
               7, 8, 9]
    
    first_line = 


=end

#NOTE: index of arr = pos - 1

LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

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
      line.all? {|i| @arr[i-1] == sign}
      end
    end 

end

# tests
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
  p "X1: #{game.won?('X')}"
  p "o1: #{game.won?(0)}"
end

# puts "Enter the position: "
# pos = gets.chomp.to_i

# p "you entered #{pos}"

# p grid.valid_pos?( pos )
# p grid.valid_pos?( 2 )
# p grid.valid_pos?( 9 )