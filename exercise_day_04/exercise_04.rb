class Century
	attr_accessor :year
	def input_info
    	puts "For year: "
        @year = gets.chomp.to_i
 	 end
 	def centuryFromYear
         puts "Result: #{(@year/100)+1}"
	end

end
century = Century.new()
century.input_info
century.centuryFromYear
