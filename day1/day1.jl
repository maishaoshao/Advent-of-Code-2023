#####################################################################
######## this is a script for practice the adventofcode 2023 ########
#####################################################################
### Notes ###
# link of the website: https://adventofcode.com/2023

########## --- Day 1: Trebuchet?! --- ##########


# using julia to work on the calibration values
# test txt file: "data/day1_input1.txt"
# test txt file: "data/day1_input2.txt"


function day1(txtfile::String)
    # read the file
    txt = open(txtfile)
    data = readlines(txt)
    value = Vector{Int64}()

    for i in 1:length(data)
        # condition 1: check how many numbers in the line
        # if there are >= 2 numbers in the line, do the following
        if length(collect(eachmatch(r"\d+", data[i]))) >= 2
            value_first = parse(Int, match(r"\d+", data[i]).match)
            value_last = parse(Int, match(r"\d+", reverse(data[i])).match)
            push!(value, parse(Int, string(value_first) * string(value_last)))
        # if there is only one number in the line, do the following
        elseif length(collect(eachmatch(r"\d+", data[i]))) == 1
            value_first = parse(Int, match(r"\d+", data[i]).match)
            push!(value, parse(Int, string(value_first) * string(value_first)))
        # if there is no number in the line, do the following
        elseif length(collect(eachmatch(r"\d+", data[i]))) == 0
            push!(value, 0)
        end
    end

    # sum up all the values
    total_sum = sum(value)
    # return the sum
    return total_sum
end

# test
day1("day1_input2.txt")
day1("day1_input1.txt")
