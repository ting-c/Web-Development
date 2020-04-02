require_relative 'board'
require_relative 'human_player'

class Game

    def initialize(board_size, player_1_mark, *other_players_mark)
        players_mark = [ player_1_mark, *other_players_mark ]

        @all_players = []
        players_mark.each do |mark, i| 
            @all_players << HumanPlayer.new(mark)
        end

        @board = Board.new(board_size)
        @current_player = @all_players[0]
    end

    def switch_turn
        k = 0
        switched = false
        while !switched
            if @current_player == @all_players[k] 
                @current_player = @all_players[ (k+1) % @all_players.length]
                switched = true
            else
                k += 1
            end
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            @pos = @current_player.get_position
            @board.place_mark(@pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                @board.print
                puts "Victory for #{@current_player.mark} !"
                return 
            else
                self.switch_turn
            end
        end
    end

end