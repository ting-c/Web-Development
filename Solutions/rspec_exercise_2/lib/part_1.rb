def partition(arr, n)
    low_arr = []
    high_arr = []
    arr.each do |ele|
        if ele < n
            low_arr << ele
        else
            high_arr << ele
        end    
    end
    return [low_arr, high_arr]
end

def merge(hash_1, hash_2)
    return hash_1.merge(hash_2)
end

def censor(str, arr)
    words = str.split(" ")
    vowels = 'aeiou'
    words.each_with_index do |word, i|
        if arr.include?(word.downcase)
            word.each_char.with_index do |char, i|
                if vowels.include?(char.downcase)
                    word[i] = "*"
                end
            end
            words[i] = word
        end
    end
    return words.join(' ')
end

def power_of_two?(n)
    k = 0
    while 2 ** k <= n
        if 2 ** k == n
            return true
        end
        k += 1
    end
    false
end