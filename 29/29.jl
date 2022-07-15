# find result
a = sort(unique([b*log(a) for a in 2:100 for b in 2:100]))
# filter for numerical error
filter(x->x>10^(-12), [a[1];[a[i] - a[i-1] for i in 2:length(a)]])
