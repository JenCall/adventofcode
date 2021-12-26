# Advent of Code 2020 Day 02
# How many passwords are valid according to their policies?

# read Input
file = File.open("input.txt")
input = file.readlines.map(&:chomp)

#PART 1
# # define valid passwords variable
# valid_password = []

# # loop through the list
# input.each do |string|
#     # define variables
#     num_1 = string.split(/-/).first.to_i
#     num_2 = string.split(/-/, 2)[1][0..1].to_i
#     letter = string.split(/:/).first[-1]
#     password = string[7..string.length]
#     count = password.count(letter)

#     # conditional statement
#     valid_password << password if (count >= num_1 && count <= num_2)
# end
# # print count of valid passwords
# p valid_password.count

#PART 2
# define valid passwords variable
valid_password = []

# loop through the list
input.each do |string|
    # define variables
    num_1 = string.split(/-/).first.to_i - 1
    num_2 = string.split(/-/, 2)[1][0..1].to_i - 1
    letter = string.split(/:/).first[-1]
    password = string[7..string.length]
    
    # conditional statement
    if (password[num_1] == letter) && (password[num_2] != letter)
        valid_password << password
    elsif (password[num_1] != letter) && (password[num_2] == letter)
        valid_password << password
    end
end
# print count of valid passwords
p valid_password.count