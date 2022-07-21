# https://projecteuler.net/problem=102 
include("../euler_utilities.jl") 

struct Point
    x
    y
end
origin = Point(0,0)
triangle_A(a::Point,b::Point,c::Point) = abs(a.x*(b.y-c.y) + b.x*(c.y-a.y) +c.x*(a.y-b.y))/2
contains_origin(a::Point,b::Point,c::Point) = triangle_A(a,b,c) == triangle_A(a,b,origin) + triangle_A(a,origin,c) + triangle_A(origin,b,c) ? true : false
line_to_points(line) = parse.(Int, line) |> x->[Point(x[1], x[2]),Point(x[3], x[4]),Point(x[5], x[6])]

triangles = open("102/p102_triangles.txt") do f
    readlines(f)
end |> x->split.(x, ",") |> x->line_to_points.(x)

map(x->contains_origin(x...), triangles) |> sum