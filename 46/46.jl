include("../euler_utilities.jl")

N = 5
p_lookup = prime_sieve_lookup(10^N)

function decompose(x::Int)
    for square_candidate in 1:Int(sqrt(x/2)÷1)
        residual = x - 2*square_candidate^2
        residual = residual % 1 == 0 ? Int(residual) : 
        if residual % 1 == 0
            residual = Int(residual)
        else
            return false
        end
        if p_lookup[residual]
            return true
        end
    end
    return false
end

oddcomposites = filter!(x->x%2==1, .!p_lookup .* collect(1:10^N))

for x in oddcomposites[2:end]
    if !decompose(x)
        print(x)
        break
    end
end
