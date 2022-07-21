# https://projecteuler.net/problem=145 
include("../euler_utilities.jl") 
using ProgressBars

# very naive way, incredibly inefficient, takes about 10 minutes, but works

# check if every digit is odd
fullyodd(x) = [parse(Int, i) % 2 == 1 for i in string(x)] |> all
# if trailing zero => return false. Else check if sum of number and reverse is fully odd
reversible(x) = x%10 == 0 ? false : fullyodd(x+parse(Int, reverse(string(x))))

num_reversible = 0
for x in ProgressBar(10:10^9)
    num_reversible += reversible(x)
end
num_reversible
