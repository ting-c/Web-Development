def zip(arr, *other_arr)
    new_arr = []
    (0...arr.length).each do |i| 
        sub_arr = []
        sub_arr << arr[i] 
        other_arr.each { |arr| sub_arr << arr[i] }
        new_arr << sub_arr
    end
    new_arr
end

def prizz_proc(arr, prc_1, prc_2)
    arr.select { |ele| !prc_1.call(ele) && prc_2.call(ele) || prc_1.call(ele) && !prc_2.call(ele) }
end

def zany_zip(arr, *other_arr)
    new_arr = []
    max_length = arr.length
    other_arr.each { |arr| max_length = arr.length if max_length < arr.length }
    (0...max_length).each do |i| 
        sub_arr = []
        arr[i] ||= nil
        sub_arr << arr[i] 
        other_arr.each do |arr| 
            arr[i] ||= nil
            sub_arr << arr[i] 
        end
        new_arr << sub_arr
    end
    new_arr
end

def maximum(arr, &prc)
    return nil if arr.empty?
    max_ele = arr[0]
    max_val = 0
    arr.each do |ele|
        result = prc.call(ele)
        if result >= max_val
            max_ele = ele
            max_val = result
        end
    end
    max_ele
end

def my_group_by(arr, &prc)
    hash = Hash.new { |h, k|  h[k] = [] }
    arr.each do |ele|
        result = prc.call(ele)
        hash[result] << ele
    end
    hash
end

def max_tie_breaker(arr, prc_1, &prc_2)
    return nil if arr.empty?
    max_ele = arr[0]
    max_val = 0
    arr.each do |ele|
        result = prc_2.call(ele)
        if result > max_val
            max_ele = ele
            max_val = result
        elsif result == max_val
            result = prc_1.call(ele)
            if result > max_val
            max_ele = ele
            max_val = result
            end
        end
    end
    max_ele
end

def silly_syllables(sent)
    words = sent.split(" ")
    new_words = []
    vowels = 'aeiou'
    words.each do |word|
        vowels_indices = []
        word.each_char.with_index do |char, i| 
            vowels_indices << i if vowels.include?(char) 
        end
        if vowels_indices.length >= 2
            first_idx , last_idx = vowels_indices[0], vowels_indices[-1]
            new_words << word[first_idx..last_idx]
        else 
            new_words << word
        end
    end
    new_words.join(" ")
end