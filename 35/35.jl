function sieve(num)
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
    prime[1:end-1]
end

index_prime = sieve(10^6)

function iscircular(x)
    str_x = string(x)
    shifts = [str_x[s:end]*str_x[1:s-1] for s in 1:length(str_x)]
    map(x->index_prime[parse(Int, x)], shifts) |> all
end

counter = 0
for i in 2:10^6
    counter += iscircular(i)
end
counter