# Advent of Code 2020 Day 02
# How many passwords are valid according to their policies?

# read Input
file = File.open("input.txt")
input = file.readlines.map(&:chomp)

# define valid passwords variable
valid_password = []


input.each do |string|
    num_1 = string.split(/-/).first.to_i
    num_2 = string.split(/-/, 2)[1][0..1].to_i
    letter = string.split(/:/).first[-1]
    password = string[7..string.length]

    count = password.count(letter)
    
    valid_password << password if (count >= num_1 && count <= num_2)
end
p valid_password.count

