class Player
    attr_reader :name, :remaining_guesses

    def initialize(name)
        @name = name.capitalize
        @remaining_guesses = 3
        
    end

    def deduct_guesses
        @remaining_guesses -= 1 if @remaining_guesses > 0
    end

    def reset_guesses
        @remaining_guesses = 3
    end

end