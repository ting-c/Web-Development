class HumanPlayer
    attr_reader :name

    def initialize(name)
        @name = name.capitalize
    end

    def prompt
        puts "Enter a position (e.g. 1,2 ) "
        input = gets.chomp.split(',').map(&:to_i)
        input
    end

end