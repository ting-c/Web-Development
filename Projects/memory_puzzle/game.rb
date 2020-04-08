require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

require 'byebug'

class Game
    
    def initialize(grid_size=4, *player_name)
        if !grid_size.even?
            puts "grid size must be an even number"
            return
        end
        @board = Board.new(grid_size)
        if player_name.empty?
            @player = ComputerPlayer.new
        else
            @player = HumanPlayer.new(player_name[0])
        end
    end

    def get_input(*pos_val)
        if @player.is_a? HumanPlayer
            pos = @player.prompt
            while !@board.valid_pos?(pos)
                pos = @player.prompt
            end
        elsif !pos_val.empty?
            pos_1, val_1 = pos_val
            if  @known_cards.has_key?(val_1) && @known_cards[val_1].length == 2           
                pos = @known_cards[val_1].select { |pos| pos != pos_1 }[0]
            elsif @known_cards.has_key?(val_1) && @known_cards[val_1][0] != pos_1 
                pos = @known_cards[val_1][0]
            else 
                pos = @player.prompt(@board.grid.length, @board.face_down_pos)
            end
        else
            pos = @player.prompt(@board.grid.length, @board.face_down_pos)
        end
        pos
    end

    def revealed_card(pos, face_value)
        row, col = pos
        @known_cards = Hash.new { |h, k| h[k] = [] }
        @known_cards[face_value] << pos
    end

    def matched_cards
        pair_pos = @known_cards.select { |k, v| v.length == 2}.values[0]
    end

    def play
        @board.populate
        @tries = 0
        while !@board.won?
            system "clear" 

            @board.render            
            pos_1 = self.get_input
            val_1 = @board.toggle(pos_1)
            self.revealed_card(pos_1, val_1)

            @board.render
            
            pos_2 = self.get_input(pos_1, val_1)
            val_2 = @board.toggle(pos_2)
            self.revealed_card(pos_2, val_2)

            @board.render
            if val_1 != val_2
                @board.toggle(pos_1)
                @board.toggle(pos_2)
                @tries += 1
            end

            sleep(1)
        end
        puts "Game Over! #{@player.name} took #{@tries} tries to complete the game"
    end

end