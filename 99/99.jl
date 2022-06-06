f = open("B:/Julia/euler/99/99.txt", "r")
maxline = 0
maxval = 0
for (i,x) in enumerate(readlines(f))
    (b,e) = split(x, ",")
    logexpr = parse(Int, e) * log(parse(Int, b))
    if logexpr > maxval
        maxval = logexpr
        maxline = i
    end
end

maxval
maxline