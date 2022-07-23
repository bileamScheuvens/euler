# https://projecteuler.net/problem=104 
include("../euler_utilities.jl") 
using ProgressBars

pandigital_pattern = count_digits(123456789)

# fibonacci memory efficient:
fib = [BigInt(0),BigInt(1)]
for x in ProgressBar(2:10^6)
    new_entry = fib[1]+fib[2]
    entry_str = string(new_entry)
    if length(entry_str) > 18
        if count_digits(entry_str[1:9]) == count_digits(entry_str[end-8:end]) == pandigital_pattern
            println("Number found: $x")
            break
        end
    end
    fib = fib[end:end]
    push!(fib, new_entry)
end

# inelegant brute force solution, smart people use formula Fₙ = round(ϕ^n / √5) 
# combined with log manipulation to retrieve first and last digits, this is much prettier
# (and around 100x faster)