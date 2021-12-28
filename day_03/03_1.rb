# AdventofCode 2020 Day 03
# Starting at the top-left corner of your map and following a slope 
# of right 3 and down 1, how many trees would you encounter?

# to be Adjusted 
input_2 = File.readlines("input.txt").map{|line| line.chomp.split('')}

def tree_count(map, vel)
	trees = 0
	pos = [0, 0]
	
	line_length = map[0].length
	map_length = map.length
	
	loop do
		pos[0] += vel[0]
		pos[1] += vel[1]
		
		break unless pos[0] < map_length
		
		pos[1] %= line_length
		trees += 1 if map[pos[0]][pos[1]] == "#"
	end

	trees
end

# Part 1
puts "#{tree_count(input_2, [1, 3])}"

# Part 2
puts "#{[[1, 1], [1, 3], [1, 5], [1, 7], [2, 1]].map{|v| tree_count(input_2, v)}.reduce(:*)}"

# Example similar: 
file = File.open("input.txt")
input = file.readlines

def trees(input,right, down)
    pos = -1 * right
    input.each_with_index.map { |line,i| 
      pos += right if i%down == 0
      (i%down == 0 && line[pos % (line.length - 1)] == "#") ? 1 : 0
    }.sum
  end
  
  puts "#{trees(input,3,1)}"
  puts "#{
        trees(input,1,1) *
        trees(input,3,1) *
        trees(input,5,1) *
        trees(input,7,1) *
        trees(input,1,2) 
        }"