# https://projecteuler.net/problem=123 
include("../euler_utilities.jl")

function prime_square_remainder(x, n)
    x = BigInt(x)
    ((x-1)^n + (x+1)^n) % x^2
end

candidates = prime_sieve(10^8)
for (i,x) in enumerate(candidates)
    if prime_square_remainder(x,i) > 10^10
        println(i)
        break
    end
end