def element_count(arr)
    count = Hash.new(0)
    arr.each { |ele| count[ele] += 1 }
    count
end

def char_replace!(str, hash)
    str.each_char.with_index do |char, i|
        if hash.has_key?(char)
            str[i] = hash[char]
        end
    end
    str
end

def product_inject(numbers)
    numbers.inject { |product, el| product * el }
end