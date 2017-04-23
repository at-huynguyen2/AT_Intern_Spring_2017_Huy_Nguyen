require "pry"
def perfect_number n
	sum = 0
	(1...n).each do |i|
		sum += i if n%i==0
	end
	return true if sum == n
	return false
end
puts "Input n : "
n = gets.to_i
(perfect_number n)?(puts "#{n} is perfect number"):(puts "#{n} is not perfect number")
