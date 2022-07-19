include("../euler_utilities.jl")
using Combinatorics

function other_n(n)
    lookup = prime_sieve_lookup(10^(n))
    candidates = parse.(Int, join.(permutations(1:n))) |> sort |> reverse
    for c in candidates
        if lookup[c]
            return c
        end
    end
end

other_n(9) # no 9 digital

other_n(8) # no 8 digital

other_n(7) # 7652413 - check
