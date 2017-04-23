require "pry"
def fibonaci n 
	return 1 if n == 1
	return 2 if n == 2
	return fibonaci(n-1) + fibonaci(n-2) if n > 2
end 

puts "n : "
$fibo = fibonaci gets.to_i
puts "Result of fibonaci function: #{$fibo}" 
