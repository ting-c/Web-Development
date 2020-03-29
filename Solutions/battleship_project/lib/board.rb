class Board
    attr_reader :size

    def self.print_grid(grid)
        grid.each do |row| 
            puts row.join(" ")
        end
    end
    
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n*n
    end

    def [](position)
        @grid[position[0]][position[1]]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def num_ships
        count = 0
        @grid.each do |row|
            row.each {|ele| count += 1 if ele == :S}
        end
        count
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[position] = :X
            false
        end
    end

    def place_random_ships
        total_ships = @size*0.25
        while total_ships > num_ships
        i = rand(0...@grid.length)
        j = rand(0...@grid.length)
        position = [i, j]
        self[position] = :S if self[position] != :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row| 
            row.map do |ele| 
                if ele==:S
                    :N
                else
                    ele
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)        
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
