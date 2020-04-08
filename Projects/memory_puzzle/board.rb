require_relative 'card'

require 'byebug'

class Board
    attr_reader :grid
    
    def initialize(grid_size)
        @grid = Array.new(grid_size) { Array.new(grid_size) }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end

    def available_positions
        positions = []
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                positions << [row, col] if @grid[row][col] == nil
            end
        end
        positions
    end


    def face_down_pos
        positions = []
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                positions << [row, col] if !@grid[row][col].face_up
            end
        end
        positions
    end

    def valid_pos?(pos)
        rows, cols = @grid.length, @grid[0].length
        row, col = pos
        return true if row.between?(0, rows - 1) && col.between?(0, cols - 1)
        false
    end

    def populate
        alpha = ('A'..'Z').to_a
        i = 0
        while self.available_positions.length > 0      
            letter = alpha[i]
            pos_1 = self.available_positions.sample
            self[pos_1] = Card.new(letter)
            pos_2 = self.available_positions.sample
            self[pos_2] = Card.new(letter)
            i += 1
        end
    end

    def won?
        @grid.each { |row| row.each { |col| return false if !col.face_up } }
        true
    end

    def toggle(pos)
        if self[pos].face_up
            self[pos].face_up = false
        else
            self[pos].face_up = true
        end
        self[pos].face_value
    end

    def render
        puts "        BOARD         "
        puts
        @grid.each do |row|
            row.each do |col| 
                if col.face_up
                    print " #{col.face_value} |".rjust(5)
                else
                    print "|".rjust(5)
                end
            end
            puts

        end
        nil
    end

end