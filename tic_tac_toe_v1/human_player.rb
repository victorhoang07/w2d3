class HumanPlayer

    def initialize(mark)
        @mark = mark
    end

    def mark
        @mark
    end

    def get_position
        p "Player #{@mark}, enter two numbers representing a position in the format `row col`"

        position = gets.chomp

        index = position.split(" ") #["0", "1"]

        alpha = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        
        if index.length != 2
            raise "please put 2 and only 2 valid numbers"
        end

        index.each do |ele|
            if alpha.include?(ele)
                raise "please use numbers"
            end
        end

        index.map {|i| i.to_i}
        
    end

end