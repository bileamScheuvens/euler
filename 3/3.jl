function isprime(x)
    for i in 2:sqrt(x)
        if x%i == 0
            return false
        end
    end
    return true
end

factors = []

function primefactor(x)
    if isprime(x)
        push!(factors, x)
    else
        for i in 2:round(sqrt(x))
            if isprime(i) && x%i==0
                push!(factors, i)
                primefactor(x/i)
                break
            end
        end
    end
end

primefactor(600851475143)
factors