include("../euler_utilities.jl") 

function n_consecutive_with_n_factors(n)
    buffer = []
    for i in 1:10^8
        if length(unique(prime_factor(i))) == n
            push!(buffer, i)
            if length(buffer) == n
                return buffer
            end
        else
            buffer = []
        end
    end
end

n_consecutive_with_n_factors(4)