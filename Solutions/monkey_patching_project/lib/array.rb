# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        sum = self.inject { |acc, ele| acc + ele }
        sum/self.length.to_f
    end

    def median
        return nil if self.empty?
        sorted = self.sort
        if sorted.length.even?
            first = sorted.length/2 - 1
            second = sorted.length/2
            return (sorted[first] + sorted[second]).to_f / 2
        else
            sorted[sorted.length/2]
        end
    end

    def counts
        count = Hash.new(0)
        self.each { |ele| count[ele] += 1 }
        count
    end

    def my_count(str)
        count = 0
        self.each { |ele| count += 1 if ele == str }
        count
    end

    def my_index(str)
        return nil if !self.include?(str)
        self.each.with_index { |ele, i| return i if ele == str}
    end

    def my_uniq
        new_arr = []
        self.each { |ele| new_arr << ele if !new_arr.include?(ele) }
        new_arr
    end

    def my_transpose
        # [0][1][2] => [2][1][0]
        new_arr = []
        (0...self.length).each do |row|
            new_row = [] 
            (0...self.length).each { |col| new_row << self[col][row] }
            new_arr << new_row 
        end
        new_arr
    end
end
