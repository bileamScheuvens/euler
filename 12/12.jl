function factorize(x)
    factors = []
    for i in 1:x
        if x%i == 0
            push!(factors, i)
        end
    end
    return factors
end


for x in 5984:10000000
    tri = sum(1:x)
    nfactors = length(factorize(tri))
    if nfactors >= 500
        println("$x -> $tri -> $nfactors")
        return break
    end
end