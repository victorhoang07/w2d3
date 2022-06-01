class ComputerPlayer

    def initialize(mark)
        @mark = mark
    end

    def mark
        @mark
    end

    def get_position(legal_positions)

        position = rand(legal_positions)
        p "the computers mark is #{@mark}, and it chose #{position}"
        return positon
    end

end
