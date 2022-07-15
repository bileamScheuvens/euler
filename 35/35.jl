include("../euler_utilities.jl")

index_prime = prime_sieve_lookup(10^6)

function iscircular(x)
    str_x = string(x)
    shifts = [str_x[s:end]*str_x[1:s-1] for s in 1:length(str_x)]
    map(x->index_prime[parse(Int, x)], shifts) |> all
end

counter = 0
for i in 2:10^6
    counter += iscircular(i)
end
counter