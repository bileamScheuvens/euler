include("../euler_utilities.jl")


triangle_nrs = [Int((n/2)*(n+1)) for n in 1:10^2]

words = open("42/p042_words.txt") do f
    readline(f)
end |> x->replace(x, "\""=>"") |> x->split(x, ",")

# map each word to sum of alphabetical positions then map each sum to 1 if triangle else 0, then sum
map(x->sum([letter_to_int(i) for i in x]), words) |> sums->map(x->x in triangle_nrs, sums) |> sum
