class ComputerPlayer
    attr_reader :name
    
    def initialize
        @name = 'Computer'
    end

    def prompt(grid_size, face_down_pos)
        puts "Enter a position (e.g. 1,2 ) "
        face_down_pos.sample
    end
    

end