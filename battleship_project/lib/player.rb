class Player
    def get_move
        puts "enter a position with coordinates separated with a space like '4 7'"

        coord = gets.chomp
    
        arr = coord.split(" ")
        arr.map {|num| num.to_i}
    end

end
