singles = Dict(
    "0"=>"",
    "1"=>"one",
    "2"=>"two",
    "3"=>"three",
    "4"=>"four",
    "5"=>"five",
    "6"=>"six",
    "7"=>"seven",
    "8"=>"eight",
    "9"=>"nine"
)

tentotwenty = Dict(
    ""=>"ten",
    "one"=>"eleven",
    "two"=>"twelve",
    "three"=>"thirteen",
    "five"=>"fifteen",
    "eight"=>"eighteen"
)
function tensexc(v1, v2)
    if v1 == ""
        return v2
    elseif v1 == "one"
        return haskey(tentotwenty, v2) ? tentotwenty[v2] : v2*"teen"
    elseif v1 == "two"
        return "twenty"*v2
    elseif v1 == "three"
        return "thirty"*v2
    elseif v1 == "four"
        return "forty"*v2
    elseif v1 == "five"
        return "fifty"*v2
    elseif v1 == "eight"
        return "eighty"*v2
    else
        return v1*"ty"*v2
    end
end

function hundredsexc(v1,v2)
    if v1 == ""
        return v2
    elseif v2 == ""
        return v1*"hundred"
    else
        return v1*"hundredand"*v2
    end
end
tens = Dict(k1*k2=>tensexc(v1,v2) for (k1,v1) in singles for (k2,v2) in singles)
hundreds = Dict(k1*k2=>hundredsexc(v1,v2) for (k1,v1) in singles for (k2, v2) in tens) 
hundreds["1000"] = "onethousand"

sum(map(x->length(x), values(hundreds)))
