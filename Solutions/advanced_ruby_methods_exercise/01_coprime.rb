# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def factors(num)
    factors = []
    (2..num).each do |int|
        if num % int == 0
            factors << int
        end
    end
    return factors
end

def coprime?(num1, num2)
    intersection = factors(num1) & factors(num2)
    return intersection.empty?
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false