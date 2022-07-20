include("../euler_utilities.jl")
doublebasepalindromesum = 0
for x in 1:10^6-1
    if is_palindrome(x) && is_palindrome(join(digits(x, base=2)))
        doublebasepalindromesum += x
    end
end
doublebasepalindromesum