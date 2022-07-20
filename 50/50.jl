include("../euler_utilities.jl")
using ProgressBars

function consecutive_sum_length(x, primes; min_length=1)
    # start with sequence of min pattern length
    current_primes = primes[1:min_length]
    # index of next prime to add
    pointer = min_length+1
    searching = true
    while searching
        current_sum = sum(current_primes)
        if length(current_primes) < min_length
            # terminate if no longer pattern found
            return 0
        elseif current_sum > x 
            # pop first
            current_primes = current_primes[2:end]
        elseif current_sum < x
            # append new and increment pointer
            push!(current_primes, primes[pointer])
            pointer += 1
        else
            return length(current_primes)
        end
    end
end

current_max = 1
max_prime = 1
primes = prime_sieve(10^7)
for i in ProgressBar(filter(x->x<10^6, primes))
    csl = consecutive_sum_length(i, primes; min_length=current_max) 
    if current_max < csl
       current_max = csl
       max_prime = i
    end
end
current_max
max_prime