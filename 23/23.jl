using ProgressBars

function factorize(x)
    factors = []
    for i in 1:x
        if x%i == 0
            push!(factors, i)
        end
    end
    return factors
end

function isabundant(x)
    sum(factorize(x)) > 2x ? true : false
end

abundants = []
for x in ProgressBar(1:28123)
    if isabundant(x)
        push!(abundants, x)
    end
end
abundants

function issum(x)
    for i in filter(val->val<x, abundants)
        if isabundant(x-i)
            return true
        end
    end
    return false
end

nabundants = []
for x in ProgressBar(1:28123)
    if !issum(x)
        push!(nabundants, x)
    end
end
nabundants

sum(nabundants)