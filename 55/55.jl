include("../euler_utilities.jl")

function is_lychrel(x)
    new_x = big(x)
    for _ in 0:50
        new_x = new_x + parse(BigInt, reverse(string(new_x)))
        if is_palindrome(new_x) 
            return false
        end
    end
    return true
end

numlychrel = 0
for x in 0:10^4
    numlychrel += is_lychrel(x)
end
numlychrel
