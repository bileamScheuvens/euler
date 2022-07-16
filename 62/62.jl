include("../euler_utilities.jl")

function solve(limit, goal_perms)
    current_buffer = []
    number_buffer = []
    checking_length = 2
    for i in 1:limit
        digitarray = count_digits(i^3)
        if sum(digitarray) > checking_length
            checking_length = sum(digitarray)
            duplicate_count = Dict([(cube,count(x->x==cube,current_buffer)) for cube in unique(current_buffer)])
            most_frequent = findmax(duplicate_count)
            if most_frequent[1] >= goal_perms
                return [number_buffer[j] for j in findall(x->x==most_frequent[2], current_buffer)]
            end
            current_buffer = []
            number_buffer = []
        end
        push!(current_buffer, digitarray)
        push!(number_buffer, i)
    end
    return "couldnt solve" # current_buffer, number_buffer
end


res = solve(10000, 5)