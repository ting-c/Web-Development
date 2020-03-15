# Write a method, union, that accepts any number of arrays as arguments.
# The method should return an array containing all elements of the given arrays.

def union(arr1, *other_arrays)
    arrays = [arr1 , *other_arrays]
    elements = []
    arrays.each do |arr|
        arr.each do |ele|
            elements << ele
        end
    end
    return elements

end

p union(["a", "b"], [1, 2, 3]) # => ["a", "b", 1, 2, 3]
p union(["x", "y"], [true, false], [20, 21, 23]) # => ["x", "y", true, false, 20, 21, 23]
