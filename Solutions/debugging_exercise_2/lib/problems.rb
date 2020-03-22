# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def prime?(num)
    return false if num < 2
    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end
    true
end

def largest_prime_factor(num)
    largest_prime_factor = 1
    (2..num).each do |factor|
        if prime?(factor) && num % factor == 0
            largest_prime_factor = factor 
        end
    end
    largest_prime_factor
end

def unique_chars?(str)
    count = Hash.new(0)
    str.each_char { |char| count[char] += 1 }
    count.each_value { |val| return false if val > 1 }
    true
end

def dupe_indices(arr)
    hash = Hash.new()

    arr.each_with_index do |ele_1, i|
        indices = []
        arr.each_with_index do |ele_2, j|
            if ele_1 == ele_2 && i < j 
                if !indices.include?(i)
                    indices << i
                end
                if !indices.include?(j)
                    indices << j
                end
                if !hash.has_key?(ele_1)
                    hash[ele_1] = indices
                end
            end
        end
    end
    return hash
end

def ana_array(arr_1, arr_2)
    hash_1 = Hash.new(0)
    hash_2 = Hash.new(0)
    arr_1.each { |ele| hash_1[ele] += 1}
    arr_2.each { |ele| hash_2[ele] += 1}
    hash_1 == hash_2
end