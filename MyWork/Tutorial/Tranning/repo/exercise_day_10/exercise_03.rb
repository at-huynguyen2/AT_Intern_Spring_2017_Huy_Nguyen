require "pry"

def substring		
	puts "*Input parrent array"
	arrParent = inputString.to_a
	puts "*Input child array"
	arrChild = inputString.to_a
	isCheck = true
	arrParent.map do |i|
		arrChild.map do |j|		
			isCheck = false if i.include?(j)
			binding.pry
		end
	end
	if isCheck == true
		puts arrChild.sort!
	end
end

def inputString 
	arr = []
	print "   *Input number array: "
	count = gets.chomp.to_i
	(1..count).each do |i|
		print "  - Input element #{i} :   "
		arr << gets.chomp
	end
	return arr
end

substring