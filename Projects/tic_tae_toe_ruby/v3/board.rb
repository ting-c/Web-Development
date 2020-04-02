class Board
    
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, "_") }

    end

    def valid?(pos)
        return true if pos.all? { |num| num >= 0 && num < @grid.length }
        false        
    end

    def empty?(pos)
        return true if @grid[pos[0]][pos[1]] == '_'
        false
    end

    def place_mark(pos, mark)
        if valid?(pos) && empty?(pos)
            @grid[pos[0]][pos[1]] = mark
        else
            raise 'Invalid position'
        end
    end

    def print
        @grid.each do |row|
            p row 
            puts
        end
    end

    def win_row?(mark)
        @grid.any? { |row| row.all? { |ele| ele == mark } }
    end

    def win_col?(mark)
        (0..@grid.length-1).each do |col|
            count = 0
            (0..@grid.length-1).each do |row|
                count += 1 if @grid[row][col] == mark 
            end
            return true if count == @grid.length
        end
        false
    end

    def win_diagonal?(mark)
        n = @grid.length - 1
        count_left = 0
        count_right = 0
        (0..n).each do |i|
            count_left += 1 if @grid[i][n-i] == mark
            count_right += 1 if @grid[i][i] == mark
        end
        return true if count_left == @grid.length || count_right == @grid.length 
        false
    end

    def win?(mark)
        return true if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
        false
    end

    def empty_positions?
        @grid.any? { |row| row.any? {|col| col == '_'} }
    end

    def legal_positions
        @legal_pos = []
        @grid.each.with_index do |ele, row|
            @grid.each.with_index do |ele, col|
                @legal_pos << [row, col] if self.empty?([row, col]) && self.valid?([row, col])
            end
        end
        @legal_pos
    end
end