# Enumerable
# My Each
# Extend the Array class to include a method named my_each that takes a block, calls the block on every element of the array, and returns the original array. Do not use Enumerable's each method. I want to be able to write:

#  # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
#      2
#      3
#      1
#      2
#      3

# p return_value  # => [1, 2, 3]
# My Select
# Now extend the Array class to include my_select that takes a block and returns a new array containing only elements that satisfy the block. Use your my_each method!

# Example:

# a = [1, 2, 3]
# a.my_select { |num| num > 1 } # => [2, 3]
# a.my_select { |num| num == 4 } # => []
# My Reject
# Write my_reject to take a block and return a new array excluding elements that satisfy the block.

# Example:

# a = [1, 2, 3]
# a.my_reject { |num| num > 1 } # => [1]
# a.my_reject { |num| num == 4 } # => [1, 2, 3]
# My Any
# Write my_any? to return true if any elements of the array satisfy the block and my_all? to return true only if all elements satisfy the block.

# Example:

# a = [1, 2, 3]
# a.my_any? { |num| num > 1 } # => true
# a.my_any? { |num| num == 4 } # => false
# a.my_all? { |num| num > 1 } # => false
# a.my_all? { |num| num < 4 } # => true
# Array
# My Flatten
# my_flatten should return all elements of the array into a new, one-dimensional array. Hint: use recursion!

# Example:

# [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
# My Zip
# Write my_zip to take any number of arguments. It should return a new array containing self.length elements. Each element of the new array should be an array with a length of the input arguments + 1 and contain the merged elements at that index. If the size of any argument is less than self, nil is returned for that location.

# Example:

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
# My Rotate
# Write a method my_rotate that returns a new array containing all the elements of the original array in a rotated order. By default, the array should rotate by one element. If a negative value is given, the array is rotated in the opposite direction.

# Example:

# a = [ "a", "b", "c", "d" ]
# a.my_rotate         #=> ["b", "c", "d", "a"]
# a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# a.my_rotate(15)     #=> ["d", "a", "b", "c"]
# My Join
# my_join returns a single string containing all the elements of the array, separated by the given string separator. If no separator is given, an empty string is used.

# Example:

# a = [ "a", "b", "c", "d" ]
# a.my_join         # => "abcd"
# a.my_join("$")    # => "a$b$c$d"
# My Reverse
# Write a method that returns a new array containing all the elements of the original array in reverse order.

# Example:

# [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# [ 1 ].my_reverse               #=> [1]


class Array

    def my_each(&prc)
        last_idx = self.length 
        last_idx.times do |i|
            prc.call(self[i])
        end
        self
    end

    def my_select(&prc)
        arr = []
        self.my_each do |ele|
            arr << ele if prc.call(ele)
        end
        arr
    end

    def my_reject(&prc)
        arr = []
        self.my_each do |ele|
            arr << ele if !prc.call(ele)
        end
        arr
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end
        true
    end

    def my_flatten
        flatten = []
        self.each do |ele|
            if ele.is_a? Array
                flatten.concat(ele.my_flatten)
            else
                flatten << ele
            end
        end
        flatten
    end

    def my_zip(*arrays)
        arr = []
        self.length.times do |i|
            sub_arr = [self[i]]
            arrays.my_each { |array| sub_arr << array[i] }
            arr << sub_arr
        end
        arr
    end

    def my_rotate(n=1)
        idx = n % 4
        self[idx..-1] + self[0...idx]
    end

    def my_join(str='')
        new_str = ''
        self.my_each { |ele| new_str += ele + str }

        return new_str[0...-1] if new_str[-1] == str
        new_str       
    end

    def my_reverse
        new_arr = []
        self.my_each { |ele| new_arr.unshift(ele) }
        new_arr
    end

end

# ### Factors
#
# Write a method `factors(num)` that returns an array containing all the
# factors of a given number.

def factors(num)
    arr = []
    (1..num).each do |fact|
    arr << fact if num % fact == 0
    end
    arr
end

# ### Bubble Sort
#
# http://en.wikipedia.org/wiki/bubble_sort
#
# Implement Bubble sort in a method, `Array#bubble_sort!`. Your method should
# modify the array so that it is in sorted order.
#
# > Bubble sort, sometimes incorrectly referred to as sinking sort, is a
# > simple sorting algorithm that works by repeatedly stepping through
# > the list to be sorted, comparing each pair of adjacent items and
# > swapping them if they are in the wrong order. The pass through the
# > list is repeated until no swaps are needed, which indicates that the
# > list is sorted. The algorithm gets its name from the way smaller
# > elements "bubble" to the top of the list. Because it only uses
# > comparisons to operate on elements, it is a comparison
# > sort. Although the algorithm is simple, most other algorithms are
# > more efficient for sorting large lists.
#
# Hint: Ruby has parallel assignment for easily swapping values:
# http://rubyquicktips.com/post/384502538/easily-swap-two-variables-values
#
# After writing `bubble_sort!`, write a `bubble_sort` that does the same
# but doesn't modify the original. Do this in two lines using `dup`.
#
# Finally, modify your `Array#bubble_sort!` method so that, instead of
# using `>` and `<` to compare elements, it takes a block to perform the
# comparison:
#
# ```ruby
# [1, 3, 5].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
# [1, 3, 5].bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending
# ```
#
# #### `#<=>` (the **spaceship** method) compares objects. `x.<=>(y)` returns
# `-1` if `x` is less than `y`. If `x` and `y` are equal, it returns `0`. If
# greater, `1`. For future reference, you can define `<=>` on your own classes.
#
# http://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator

class Array
  def bubble_sort!(&prc)
    iterate = true
    while iterate
        iterate = false
        self.each_with_index do |ele, i|
            val = prc.call(ele, self[i+1]) 
            if val == 1
                self[i], self[i+1] = self[i+1] , self[i] 
                iterate = true
            end
        end
      end
      self
  end

  def bubble_sort(&prc)
        new_arr = self.dup
        new_arr.bubble_sort!(&prc)
  end
end

# ### Substrings and Subwords
#
# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.
#
# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).

def substrings(string)
    arr = []    
    string.each_char.with_index do |char1, i|
        new_str = ''
        new_str += char1
        arr << new_str
        string.each_char.with_index do |char2, j|
            if i < j
                new_str += char2
                arr << new_str
            end
        end
    end
    arr
end


def subwords(word, dictionary)
    substrings(word).select { |word| dictionary.include?(word) }
end

# p subwords('incandescent', ['i', 'in', 'inca', 'can', 'a', 'an', 'and', 'descent', 'scent', 'ent'])

# ### Doubler
# Write a `doubler` method that takes an array of integers and returns an
# array with the original elements multiplied by two.

def doubler(array)
    array.map { |ele| ele*2 }
end

# p doubler([1,3,9,12])
