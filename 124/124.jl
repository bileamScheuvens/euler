include("../euler_utilities.jl")

table = Dict(n=>radical(n) for n in 1:10^5)
sorted = sort(collect(table),by=x->(x[2], x[1]))
sorted[10^4][1]