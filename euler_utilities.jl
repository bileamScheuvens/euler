function count_digits(x)
    result = zeros(Int8, 10)
    for i in string(x)
        result[parse(Int8, i)+1] += 1
    end
    result
end

function prime_sieve_lookup(num)
    prime = [true for i in 1:num+1]
    p=2
    while p^2 <= num
        if prime[p]
            for i in p^2:p:num+1
                prime[i] = false
            end
        end
        p+=1
    end
    [false; prime[2:end-1]]
end
prime_sieve(num) = filter(x->x!=0, collect(1:num) .* prime_sieve_lookup(num))

function prime_factor(x::Int)
    if x == 1
        return [1]
    end
    candidates = prime_sieve(Int(sqrt(x)÷1+1))
    factors = []
    factoring = true
    while factoring
        for c in candidates
            if x % c == 0
                x = Int(x/c)
                push!(factors, c)
                break
            elseif c == candidates[end]
                x == 1 ? nothing : push!(factors, x)
                factoring = false
            end
        end
    end
    factors
end
radical(x) = prod(unique(prime_factor(x)))

is_palindrome(x::String) = x == reverse(x)
is_palindrome(x::Int) = is_palindrome(string(x))
is_palindrome(x::BigInt) = is_palindrome(string(x))

letter_to_int(x::Char) = (Int(x)-64)%32

read_matrix(filepath) = open(filepath) do f
    readlines(f)
end |> x->split.(x, ",") |> x->permutedims(hcat(x...)) |> x->parse.(Int, x)

export count_digits

export prime_sieve_lookup
export prime_sieve

export prime_factor
export radical

export is_palindrome

export letter_to_int

export read_matrix