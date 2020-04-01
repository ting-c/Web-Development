class GuessingGame
    def initialize(min, max)
        @secret_num = min + rand(max-min)
        @num_attempts = 0
        @game_over = false
    end

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1
        if @secret_num == num
            @game_over = true 
            p 'you win'
        elsif @secret_num < num
            p 'too big'
        else
            p 'too small'
        end
    end

    def ask_user
        p 'enter a number'
        num = gets.chomp.to_i
        check_num(num)
    end
end