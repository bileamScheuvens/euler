include("../euler_utilities.jl")

N=5
p_lookup = prime_sieve_lookup(10^5)

for i in 1000:3339
    a,b,c = [i, i+3330, i+6660]
    if p_lookup[a]*p_lookup[b]*p_lookup[c]*(count_digits(a)==count_digits(b)==count_digits(c))
        println(a,b,c)
    end
end
