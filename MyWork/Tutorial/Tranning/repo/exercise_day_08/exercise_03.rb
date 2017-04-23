require "pry"
require "benchmark"
#a = (1..n).collect {|i| i*i if i*i<n}
#a.compact!	
def get_squares n
	a = Array.new
	(1..n).map do |i|
	  a.push(i*i) if i*i<n
	end
	return a
end

puts "input n: "
puts "Perfect square array is #{get_squares gets.to_i}"


