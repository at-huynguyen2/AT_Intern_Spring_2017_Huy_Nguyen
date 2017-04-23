require "pry"
def prime_number n
	return true if n<2
	(2..Math.sqrt(n)).each do |i|
		return false if n%i==0
	end
	return true
end

puts "Input n : "
n = gets.to_i
(prime_number n)?(puts "#{n} is prime number"):(puts "#{n} is not prime number")
