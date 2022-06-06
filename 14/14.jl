function step(x)
    x % 2 == 0 ? x/2 : 3x+1
end

function collatz(x)
    length = 1
    while x != 1
        length += 1
        x = step(x)
    end
    return length
end

chains = [collatz(i) for i in 1:10^6]

findmax(chains)