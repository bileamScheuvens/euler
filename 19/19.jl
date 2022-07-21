#https://projecteuler.net/problem=19 
# Monday => 0, Tuesday => 1, ...
# 1.1.1900 = 0 
# really not too proud of this one :/

include("../euler_utilities.jl")

function sundays_on_first(year, firstday)
    leap = year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
    days_per_month = [31, 28+leap, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    firstofmonth = [0]
    [push!(firstofmonth, firstofmonth[m]+days_per_month[m]) for m in 1:11]
    sundaycounter = 0
    days = ["mo", "tu", "we", "th", "fr", "sa", "su"]
    for i in 0:364+leap
        if i in firstofmonth && (i+firstday) % 7 == 6
            sundaycounter += 1
        elseif i == 364+leap
            # return number of sundays and first day of next year
            return sundaycounter, 1+(i+firstday)%7
        end
    end
end

total_sundays = 0
_, next_first_day = sundays_on_first(1900, 0) 
for year in 1901:2000
    sundays, next_first_day = sundays_on_first(year, next_first_day)
    total_sundays += sundays
end 
total_sundays