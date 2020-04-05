require_relative 'player'

class Game
    attr_reader :players
    
    def initialize(player_1_name, *other_players_name)
        names = [player_1_name, *other_players_name]
        @players = []
        names.each do |name| 
            @players << Player.new(name)
        end
        
        words = File.open('dictionary.txt').read.split("\n")
        @dictionary = Set.new(words)
        @round = 1
        @fragment = ''
        @losses = {}
        @players.each {|player| @losses[player.name] = 0}
    end

    def current_player
        @current_player = @players[(@round - 1) % @players.length]
    end

    def previous_player
        @previous_player = @players[(@round - 2) % @players.length]
    end

    def next_player!
        @previous_player =  @current_player
        next_player_idx = (@players.index(@current_player) + 1 ) % @players.length
        @current_player = @players[next_player_idx]
    end

    def take_turn(player)
        puts 
        puts "#{player.name}'s turn" 
        puts 'Enter a letter'
        char = gets.chomp.downcase
        if self.valid_play?(char)
            @fragment += char
            puts "Fragment:  #{@fragment}"
            if self.win?
                puts '----------------------'
                puts "Congratulations! You have created a word in the dictionary"
                @players.each do |p|
                    if p != player
                        puts "#{p.name} lose this round!" 
                        @losses[p.name] += 1
                    end
                end
                return
            end
        else
            puts '----------------------'
            puts 'Invalid play'
            player.deduct_guesses
            if self.lose?
                puts "No more remaining guesses!"
                puts "#{player.name} lose this round!" 
                @losses[player.name] += 1
                return
            else
                puts "#{player.remaining_guesses} remaining guesses "
                return false
            end
        end
        true
    end

    def valid_play?(char)
        return false if !('a'..'z').cover?(char) || char.length != 1
        new_str = @fragment + char
        @dictionary.each { |word| return true if word.include?(new_str) }
        false
    end

    def lose?
        return true if @current_player.remaining_guesses == 0
        false
    end

    def win?
        return true if @dictionary.include?(@fragment)
        false
    end

    def play_round
        self.current_player
        self.previous_player

        self.display_standings
        puts
        puts "--Round #{@round}--"
        @players.each { |player| player.reset_guesses }
        @fragment = ''

        while !self.lose? && !self.win?
            self.next_player! if self.take_turn(@current_player)         
        end

        @round += 1
    
    end

    def record(player)
        num_of_losses = @losses[player.name]
        'GHOST'[0..num_of_losses-1]
    end

    def display_standings
        puts '----------------------'
        puts "CURRENT STANDINGS"
        sorted_losses = @losses.sort_by { |name, loss| loss }.to_h
        sorted_losses.each { |name, loss| puts "#{name} : #{loss} losses" }
    end

    def run
        while !@losses.value?(5)
            self.play_round
        end
        self.display_standings
        puts
        puts "#{@losses.key(@losses.values.max)} is the loser!"

    end


end