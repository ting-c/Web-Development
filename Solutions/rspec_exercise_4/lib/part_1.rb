def my_reject(arr, &prc)
    arr.select { |ele| !prc.call(ele)}
end

def my_one?(arr, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele) }
    return true if count == 1
    false
end

def hash_select(hash, &prc)
    new_hash = {}
    hash.each { |k, v| new_hash[k] = v if prc.call(k, v) }
    new_hash
end

def xor_select(arr, prc_1, prc_2)
    arr.select do |ele|
        ( prc_1.call(ele) && !prc_2.call(ele) ) || ( !prc_1.call(ele) && prc_2.call(ele) )
    end
end

def proc_count(val, procs)
    count = 0
    procs.each do |proc|
        count += 1 if proc.call(val)
    end
    count
end