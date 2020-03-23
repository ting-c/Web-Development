def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    words = str.split(" ")
    new_words = words.map { |word| prc.call(word) }
    new_words.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
    return prc_1.call(num) if prc_1.call(num) > prc_2.call(num)
    prc_2.call(num)
end

def and_selector(arr, prc_1, prc_2)
    arr.select { |ele| ele if prc_1.call(ele) && prc_2.call(ele) }
end

def alternating_mapper(arr, prc_1, prc_2)
    new_arr = []
    arr.each_with_index do |ele, i|
        if i.even?
            new_arr << prc_1.call(ele)
        else
            new_arr << prc_2.call(ele)
        end
    end
    new_arr
end