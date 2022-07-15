digit_fac(x) = sum([factorial(parse(Int8, i)) for i in string(x)])
y = [digit_fac(x) for x in 1:10^5] # 10^5 to 10^7 have no hits, so this seems to be it
for i in 1:length(y)
    y[i] = y[i] == i ? i : 0
end
sum(y)