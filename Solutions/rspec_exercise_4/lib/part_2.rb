def proper_factors(num)
    factors = []
    (1...num).each { |fact| factors << fact if num % fact == 0 }
    factors
end

def aliquot_sum(num)
    proper_factors(num).inject { |sum, el| sum += el }
end

def perfect_number?(num)
    return true if num == aliquot_sum(num)
    false
end

def ideal_numbers(n)
    perfect_numbers = []
    k = 1
    while perfect_numbers.length < n
        perfect_numbers << k if perfect_number?(k)
        k += 1
    end
    perfect_numbers
end