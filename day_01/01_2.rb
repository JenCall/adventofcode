# Find the two entries in the list that sum to 2020. 
# Multiplying them together produces the required result.

file = File.open("input.txt")
input = file.readlines.map(&:chomp).map(&:to_i)

# Brute Force Solution

# Part 1
input.each do |i|
    input.each do |n|
        sum = i + n 
        if sum == 2020
            puts i * n
            exit
        end
    end
end

# Part 2
input.each do |num_1|
    input.each do |num_2|
        input.each do |num_3|
            sum = num_1 + num_2 + num_3
            if sum == 2020
                puts num_1 * num_2 * num_3
                exit
            end
        end
    end
end

# Divide and Conquer Solution
left = 0
right = input.length - 1
input = input.sort

# Part 1
while left < right do
    sum = input[left] + input[right]
    if sum == 2020
        p input[left] * input[right]
        break
    elsif sum > 2020
        right -= 1
    elsif
        left += 1
    end
end

# Part 2
input.each do |num_1|
    while left < right do
        sum = num_1 + input[left] + input[right]
        if sum == 2020
            p num_1 * input[left] * input[right]
            break
        elsif sum > 2020
            right -= 1
        elsif
            left += 1
        end
    end
end