include("../euler_utilities.jl")

function chain_length(x)
    counter = 1
    history = [x]
    while true
        next_x = sum(factorial.(digits(history[end])))
        if next_x in history
            return counter
        else
            counter += 1
            push!(history, next_x)
        end
    end
end

sixtylong_chains = 0
for i in 1:10^6
    sixtylong_chains += chain_length(i) == 60
end
sixtylong_chains