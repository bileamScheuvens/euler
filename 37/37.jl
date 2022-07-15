include("../euler_utilities.jl")

N = 10^6 

primes = prime_sieve(N)
prime_lookup = prime_sieve_lookup(N)

function check_truncatable(x; left=true)
    x = string(x)
    for i in 1:length(x)
        if prime_lookup[parse(Int64, left ? x[i:end] : x[1:i])] == 0
            return false
        end
    end
    return true
end


sum([x for x in primes[6:end] if check_truncatable(x)*check_truncatable(x, left=false)])
