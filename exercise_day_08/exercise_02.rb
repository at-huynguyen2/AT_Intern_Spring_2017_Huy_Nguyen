require "pry"
require "benchmark"

def sumN n
	return 0 if n<0
	puts "Sum 0..#{n} is :"
	return (1..n).inject {|acc,n| acc + n}
end
puts "Input last number : "
puts sumN gets.to_i