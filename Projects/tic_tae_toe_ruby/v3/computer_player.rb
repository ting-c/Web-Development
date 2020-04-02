class ComputerPlayer
    attr_reader :mark
    
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        puts "#{@mark}'s turn"
        @pos = legal_positions.sample
        puts "Computer choose the position #{@pos}"
        @pos
    end


end
