class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        puts "#{@mark}'s turn"
        puts 'Enter the position as two numbers with a space inbetween e.g. 0 2 '
        @pos = gets.chomp.split(" ")
        @pos.map! { |ele| ele = ele.to_i }
        while !legal_positions.include?(@pos) 
            puts 'Invalid input, enter another position' 
            @pos = gets.chomp.split(" ")
            @pos.map! { |ele| ele = ele.to_i }
        end
        @pos       
    end
 
end