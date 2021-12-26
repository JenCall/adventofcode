# Advent of Code 2020 Day 02
# How many passwords are valid according to their policies?

# read Input
file = File.open("input.txt")
input = file.readlines.map(&:chomp)

#PART 1
# define valid passwords variable
valid_password = []

# loop through the list
input.each do |string|
    # define variables
    num_1 = string.split(/-/).first.to_i
    num_2 = string.split(/-/, 2)[1][0..1].to_i
    letter = string.split(/:/).first[-1]
    password = string[7..string.length]
    count = password.count(letter)

    # conditional statement
    valid_password << password if (count >= num_1 && count <= num_2)
end
# print count of valid passwords
puts valid_password.count

# PART 2 - simple
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
puts valid_password.count

# PART 2-2 structured into class
class Password
    attr_accessor :min, :max, :letter, :value
  
    def initialize(min:, max:, letter:, value:)
      @min = min.to_i - 1
      @max = max.to_i - 1
      @letter = letter
      @value = value
    end
  
    def valid_password?
      letters = value.scan /\w/
      return true if letters[min] == letter && letters[max] != letter
      return true if letters[min] != letter && letters[max] == letter
  
      false
    end
  
    def to_s
      "#{letter}  #{min}  #{max}  #{value}"
    end
  end
  
  contents = File.open("input.txt").read.split("\n")
  passwords = []
  
  contents.map do |item|
    key, value = item.split(':')
    quantity, letter = key.split(' ')
    passwords << Password.new(min: quantity.split('-').first, max: quantity.split('-').last, letter: letter, value: value)
  end
  
  puts "Total: #{passwords.select { |pass| pass.valid_password? }.count}"