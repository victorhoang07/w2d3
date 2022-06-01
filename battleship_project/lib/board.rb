class Board
  
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def size
        @size
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, v)
        @grid[pos[0]][pos[1]] = v
    end

    def num_ships
        count = 0
        @grid.each do |subarray|
            subarray.each do |ele|
                count += 1 if ele == :S
            end
        end
        count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        else 
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        ships = 0.25 * self.size
        
        while self.num_ships < ships
            row = rand(0..@grid.length - 1)
            column = rand(0..@grid.length - 1)
            pos = [row, column]
            self[pos] = :S
        end
    end

    def hidden_ships_grid

        hidden = @grid.map do |subarray| #[s,n]
                subarray.map do |ele| # s
                    if ele == :S
                        :N
                    else
                        ele
                    end
                end
            end
        return hidden
    end

    def self.print_grid (grid)
        grid.each do |subarray|
            puts subarray.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
