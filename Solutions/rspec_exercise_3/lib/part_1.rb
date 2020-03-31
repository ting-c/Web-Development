def is_prime?(num)
    return false if num < 2
    (2...num).each do |fact|
        return false if num % fact == 0
    end
    true
end

def nth_prime(num)
    primes = []
    continue = true
    prime = 2
    while continue
            primes << prime if is_prime?(prime)
            prime += 1
            continue = false if primes.length == num
    end
    primes[-1]
end

def prime_range(min, max)
    primes = []
    continue = true
    prime = min
    while continue
            primes << prime if is_prime?(prime)
            prime += 1
            continue = false if prime > max
    end
    primes
end
