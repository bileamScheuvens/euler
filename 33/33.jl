# curious fractions
# a=cat(a1,a2), b=cat(b1,b2), a<b, digits(a) = digits(b) = 2
# a/b =!= a1/b1 if a2==b2,  a1/b2 if a2==b1, ...
# (a,b) ∈ {x1...x4}
# ∏X = aₓ / bₓ 
# return bₓ


function cancelout(a_canceled, a_sticking, b1, b2)
    residue = filter(x->x!=a_canceled, [b1,b2])
    if length(residue) == 1
        return a_sticking / residue[1]
    end
    return Nothing
end

X=[]
for a1 in 1:9
    for a2 in 1:9
        for b1 in a1:9
            for b2 in 0:9
                fullfraction = parse(Int8, "$a1$a2") / parse(Int8, "$b1$b2")
                if cancelout(a1, a2, b1, b2) == fullfraction || cancelout(a2, a1, b1, b2) == fullfraction
                    if "$a1$a2" != "$b1$b2"
                        push!(X, (parse(Int8, "$a1$a2"), parse(Int8, "$b1$b2")))
                    end
                end
            end
        end
    end
end

X = hcat(first.(X), last.(X))
aₓ = prod(X[:,1])
bₓ = prod(X[:,2])
# aₓ / bₓ = 1/100