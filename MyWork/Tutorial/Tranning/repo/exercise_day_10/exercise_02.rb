require 'pry'

def checkNumber d
	(d =~ /\A\d+\z/) ? d.to_i : false 
end

def correctTime str
	arr = str.split(':')
	h = checkNumber arr.at(0)
	m = checkNumber arr.at(1)
	s = checkNumber arr.at(2)
	if (h>24)
		puts "uncorrect validate"
		return
	end
	if s>60
		m = (((s-60)/60 >= 1)?(h += (s-60)/60) : (m+=1))
		s = s-60
	end
	if m>60
		h = (((m-60)/60 >= 1)?(h += (m-60)/60) : (h+=1))
		m = m-60
	end
	puts "#{h}:#{m}:#{s}"
end

puts "Input time (stand is hh:mm:ss) : "
time = gets.chomp
correctTime time
#p checkNumber "7894"