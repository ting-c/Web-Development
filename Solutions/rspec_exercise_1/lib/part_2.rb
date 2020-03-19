def hipsterfy(str)
    vowels = 'aeiou'
    str.reverse!
    new_str = ""
    found_first_vowel = false
    str.each_char.with_index do |char, i|
        if !found_first_vowel && vowels.include?(char)
            found_first_vowel = true
            next
        else
            new_str += char
        end
    end
    return new_str.reverse
end

def vowel_counts(str)
    count = Hash.new(0)
    str.each_char { |char| count[char.downcase] += 1}
    return count
end

def caesar_cipher(str, n)
    alpha = 'abcdefghijklmnopqrstuvwxyz'
    new_str = ''
    str.each_char do |char|
        index = alpha.index(char)
        if !index
            new_str += char
        else
            new_index = (index + n)%alpha.length
            new_str += alpha[new_index]
        end
    end
    return new_str
end