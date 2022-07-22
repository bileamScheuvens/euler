# https://projecteuler.net/problem=45 
include("../euler_utilities.jl") 

N = 10^5
# intersect the triangle, pentagonal and hexagonal numbers up to some high number,
# until something bigger than 40755 pops up
Int(intersect([n*(n+1)/2 for n in 1:N], [n*(3n-1)/2 for n in 1:N], [n*(2n-1) for n in 1:N])[3])


