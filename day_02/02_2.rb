file = File.open("input.txt")
input = file.readlines.map(&:chomp)

input.each do |string|
    num_1 = string.split(/-/).first
    num_2 = string.split(/-/, 2)[1][0..1].to_i
    letter = string.split(/:/).first[-1]
    password = string[7..string.length]
end
