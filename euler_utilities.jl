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

export count_digits
export prime_sieve_lookup
export prime_sieve