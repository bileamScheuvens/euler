using ProgressBars

function isinc(x)
    num = string(x)
    for index in 2:length(num)
        if num[index] < num[index-1]
            return false
        end
    end
    return true
end

function isdec(x)
    num = string(x)
    for index in 2:length(num)
        if num[index] > num[index-1]
            return false
        end
    end
    return true
end

isbouncy(x) = !isinc(x) && !isdec(x)

bouncy = 0
for x in ProgressBar(10:10000000)
    if isbouncy(x)
        bouncy += 1
    end
    frac = bouncy/x 
    if frac == 0.99
        println("threshold reached")
        println("$x - $frac")
        break
    end
end