require "byebug"


class Board

    def initialize(n)
        @grid = Array.new(n){Array.new(n, "_")}   
    end

    def grid
        @grid
    end

    def valid?(position)
        row = position[0]
        column = position[1]
        return false if row < 0 || column < 0 || row > @grid.length - 1 || column > @grid.length - 1
        return @grid[row][column] != nil
    end

    def empty?(position)
        row = position[0]
        column = position[1]
        return false if row < 0 || column < 0
        return @grid[row][column] == "_"
    end

    def place_mark(position, mark)
        row = position[0]
        column = position[1]
        if self.valid?(position) && self.empty?(position)
            @grid[row][column] = mark
        else
            raise "this is not a valid position or it is not empty"
        end
    end

    def print
        (0..@grid.length - 1).each {|i| p self.grid[i]}
    end

    def win_row?(mark)
        @grid.each do |row|
            if row.all? {|ele| ele == mark}
                return true
            end
        end
        return false
    end

    def win_col?(mark)
         @grid.transpose.each do |row|
            if row.all? {|ele| ele == mark}
                return true
            end
        end
        return false
    end

    def win_diagonal?(mark)
        rtl = (0..@grid.length - 1).all? do |i|
            @grid[i][i] == mark
        end
        return true if rtl

        column = @grid.length - 1
        row = 0 
        while column >= 0
            if @grid[row][column] == mark
                column -= 1
                row += 1
            else
                return false
            end
        end
        return true
    end

    def win?(mark)
        self.win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.any? {|ele| ele == "_"}
    end

end
