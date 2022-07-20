include("../euler_utilities.jl")
using ProgressBars

for x in ProgressBar(1:10^9)
    x_digits = count_digits(x)
    if [count_digits(i*x) == x_digits for i in 2:6] |> all
        println(x)
        break
    end
end

