using MatrixNetworks
using SparseArrays

function calc_saving(A)
     g = MatrixNetwork(sparse(A))
     ti,tj,tv,nverts = mst_prim(g)
     sum(g.vals)÷2 - sum(tv)
end

# example case
A = [0 16 12 21 0 0 0;
     16 0 0 17 20 0 0;
     12 0 0 28 0 31 0;
     21 17 28 0 18 19 23;
     0 20 0 18 0 0 11;
     0 0 31 19 0 0 27;
     0 0 0 23 11 27 0
]

calc_saving(A)

# test case
lines = open("107/p107_network.txt") do f
     readlines(f)
end

lines = split.(replace.(lines, "-"=>"0"), ",")
A = parse.(Int16, permutedims(hcat(lines...)))

calc_saving(A)