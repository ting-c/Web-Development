def palindrome?(str)
    last_idx = str.length-1
    (0..last_idx).each do |i|
        if str[i] != str[last_idx-i]
            return false
        end
    end
    true
end

def substrings(str)
    chars = str
    arr = []
    chars.each_char.with_index do |char_1, i|
        new_str = chars[i]
        arr << new_str
        chars.each_char.with_index do |char_2, j|
            if i < j
                new_str += chars[j]
                arr << new_str
            end
        end
    end
    return arr
end

def palindrome_substrings(str)
    arr = []
    sub_str = substrings(str)
    sub_str.each do |substring|
        if palindrome?(substring) && substring.length > 1
            arr << substring
        end
    end
    return arr
end