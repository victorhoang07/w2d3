require_relative "board.rb"
require_relative "human_player.rb"


class Game

    def initialize(n, *marks)
        
        @players = marks.map {|mark| HumanPlayer.new(mark)}
        @current_player = @players[0]
        @board = Board.new(n)

        
        
    end

    def switch_turn
        @current_player = @players.rotate![0]
    end

    def play

        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                @board.print
                return "Congrats Player #{@current_player.mark}, you WIN!"
            else
                self.switch_turn
            end
        end

        return "draw"
    end
end