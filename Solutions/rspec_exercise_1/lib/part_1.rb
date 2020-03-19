def average(num_1, num_2)
    (num_1 + num_2) / 2.0
end

def average_array(arr)
    sum = arr.inject { |acc, ele| acc + ele }
    sum / arr.length.to_f
end

def repeat(str, n)
    new_str = str*n
    return new_str
end

def yell(str)
    str.upcase!+"!"
end

def alternating_case(str)
    words = str.split(" ")
    words.each_with_index do |word, i|
        if i % 2 == 0
            word.upcase!
        else 
            word.downcase!
        end
    end
    words.join(" ")
end