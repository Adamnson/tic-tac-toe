#NOTE: index of arr = pos - 1
require 'pry-byebug'

#*******************************************
# CONSTANTS
#*******************************************

LINES = [[1,2,3], [4,5,6], [7,8,9], 
         [1,4,7], [2,5,8], [3,6,9], 
         [1,5,9], [3,5,7]]

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
      if (pos >=1 and pos <=9)  
        if ( (@arr[pos-1] != 'X') and (@arr[pos-1] != 0) )
          return true
        end
      end
      false
    end

    def add_mark(player, pos)
      player.valid_pos = valid_pos?(pos)
      if player.valid_pos
        @arr[pos-1] = player.sign
      else
         puts "Position choice invalid"
      end
    end
end

#*******************************************

class Player
  attr_accessor :sign, :valid_pos

    def initialize(sign)
      @sign = sign
      @valid_pos = false
    end

    def reset_pos()
      @valid_pos = false
    end

    def won?(board)
      LINES.any? do |line| 
      line.all? {|pos| board.arr[pos-1] == self.sign}
      end
    end 

    def celebrate()
      puts "#{self.sign} wins"
    end

    def better_luck()
      puts "Better luck nex time #{self.sign}"
    end
end

#*******************************************
# main()
#*******************************************

board = Game.new([1,2,3,4,5,6,7,8,9])

player1 = Player.new("X")
player2 = Player.new(0)


until player1.won?(board) or player2.won?(board) do 
  board.draw_grid()
  until player1.valid_pos do
    puts "Player 1, select your position: "
    pos = gets.chomp.to_i
    board.add_mark(player1, pos)
  end
  if player1.won?(board)
    board.draw_grid()
    player1.celebrate()
    player2.better_luck()
    break
  end
  board.draw_grid()
   until player2.valid_pos do
    puts "Player 2, your turn: "
    pos = gets.chomp.to_i
    board.add_mark(player2, pos)
  end
  if player2.won?(board)
    board.draw_grid()
    player1.better_luck()
    player2.celebrate()
    break
  end
  player1.reset_pos()
  player2.reset_pos()
end

#*******************************************
# debugging and testing
#*******************************************

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