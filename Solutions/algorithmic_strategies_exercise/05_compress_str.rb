# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    arr = str.split('')
    new_arr = []
    count = 1
    arr.each_with_index do |ele, i|
        if ele == arr[i+1]
            count += 1
        else
            if count == 1
                new_arr.push(ele)
            else
                new_arr.push(count.to_s + ele)
                count = 1
            end
        end
    end
    return new_arr.join()
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
