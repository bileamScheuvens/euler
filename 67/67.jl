# read text file as string
gridstr = read(open(pwd()*"\\67\\p067_triangle.txt", "r"), String)
# split on newline, then on space and convert to Int64
grid = map(x->map(x->parse(Int64, x),split(x, " ")), split(gridstr, "\n")[1:end-1])
ncols = length(grid[end])
nrows = length(grid)
# fill with zeros
for x in grid
    append!(x, repeat([0], ncols-length(x)))
end
# convert to matrix
grid = transpose(reshape(collect(Iterators.flatten(grid)), (100,100)))
# init matrices for both highest sum that can be achieved at any point and better direction
bestvalue = zeros(Int64,size(grid))
bestdir = zeros(Int64,size(grid))
bestvalue[end,:] = grid[end,:]

"""
compare children and add bigger one, as well as keeping track of which one was chosen.
left=>0
right=>1
"""
function update_cell!(x,y)
    l = bestvalue[x+1, y]
    r = bestvalue[x+1, y+1]
    dir = l>r ? 0 : 1
    bestvalue[x,y] = grid[x,y] + bestvalue[x+1, y+dir]
    bestdir[x,y] = dir
end
for x in reverse(1:size(grid)[1]-1)
    for y in reverse(1:size(grid)[2]-1)
        update_cell!(x,y)
    end
end
bestvalue