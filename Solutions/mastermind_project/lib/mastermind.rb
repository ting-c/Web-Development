require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(guess_code)
        puts "#{@secret_code.num_exact_matches(guess_code)} exact matches."
        puts "#{@secret_code.num_near_matches(guess_code)} near matches."
    end

    def ask_user_for_guess
        puts "Enter a code"
        guess_string = gets.chomp
        guess_code = Code.from_string(guess_string)
        print_matches(guess_code)
        @secret_code==(guess_code)
    end
end
