require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game

    def initialize(board_size, hash)
        @board = Board.new(board_size)

        # hash keys = marks
        # hash vals = boolean (t = computer, f = human players)
        @all_players = []
        hash.each do |mark, bool|
            if bool == false
                @all_players << HumanPlayer.new(mark) 
            else
                @all_players << ComputerPlayer.new(mark) 
            end
        end     
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
            @pos = @current_player.get_position(@board.legal_positions)
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