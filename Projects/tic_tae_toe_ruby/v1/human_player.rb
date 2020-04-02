class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "#{@mark}'s turn"
        puts 'Enter the position as two numbers with a space inbetween e.g. 0 2 '
        @pos = gets.chomp.split(" ")
        
        while @pos.length != 2 || @pos.any? { |ele| ele.to_i.to_s != ele }
            puts 'Invalid input, enter the position again' 
            @pos = gets.chomp.split(" ")
        end

        @pos.map! { |ele| ele = ele.to_i }
    end
end