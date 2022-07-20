include("../euler_utilities.jl")

# sketchy redefinition for cornercase
import Base.min
Base.min(::Nothing) = 0

# given case
A = [
    131 673 234 103 18;
    201 96 342 965 150;
    630 803 746 422 111;
    537 699 497 121 956;
    805 732 524 37 331
]


function check_cell(i, j, A, Aₜ) 
    down = i < size(A)[1] ? Aₜ[i+1, j] : -1
    right = j < size(A)[2] ? Aₜ[i, j+1] : -1
    A[i,j] + min(filter(x->x!=-1, [down, right])...)
end


function find_cheapest_path(A)
    # initialize temporary Matrix for storing current bests
    Aₜ = zeros(size(A))
    # reverse fill Aₜ
    for i in reverse(1:size(A)[1])
        for j in reverse(1:size(A)[2])
            Aₜ[i,j] = check_cell(i,j,A,Aₜ)
        end
    end
    # return top left cell of Aₜ: holds cheapest way to get there
    Int(Aₜ[1,1])
end

find_cheapest_path(A)

# test case
find_cheapest_path(read_matrix("81/p081_matrix.txt"))