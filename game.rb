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
=end

#NOTE: index of arr = pos - 1


def draw_grid(arr)
    arr.each_with_index do |i, id|
        print " #{i} "
        print "|" if ( ((id+1) % 3) > 0)
        puts "\n---+---+---" if ( (id!=8) && (((id+1)%3) == 0) ) 
    end
    puts "\n"
end

def check_validity(arr, pos)
  if ( (arr[pos-1] != 'X') and (arr[pos-1] != 0) )
    return true
  end
  false
end

arr = [1, 'X', 0, 'X', 'X', 0, 7,8, 0]
draw_grid(arr)

puts "Enter the position: "
pos = gets.chomp.to_i

p "you entered #{pos}"

p check_validity(arr, pos)
p check_validity(arr, 2)
p check_validity(arr, 9)