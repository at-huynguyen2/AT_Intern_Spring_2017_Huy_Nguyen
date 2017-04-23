#Daily report Ruby

####I. CONTROL FLOW
1. if statement
	Use also all other language but in Ruby if statement have multi orther syntax follow: 
	* IF
		syntax 1:
			if ([condition statemnent])  
				[block code 1] 
			elseif (condition 2 statement) 
				[block code 2] 
			else
				 [block code 3]
			end
			example: 
				x = 3
				y = 9
				if (x<y)
					puts “x>y”
				elseif (x>y)
					puts “x>y”
				else 
					puts “x=y”
			Output show out screen is : x<y
		syntax 	2: inline if statement
			example: 
				x = 3
				y = 5
				puts “x<y” if(x<y)
		syntax 3: ternary conditional
			example: 
				(gets.to_i > 5)? (puts "Greater than 5") : (puts "Less or equal than 5")
			Input: 4
			Output: Less of equal than 5
	*UNLESS: 
		The same if statement but if statement perfrom bock code when condition statement 	is true but unless statement perform when condition statement false.
		Syntax: 
			unless ([condition statemnent])  
				[block code 1] 
			else
				 [block code 2]
			end
		example: 	
			isBored = false
			unless isBored
				puts “Continue to learn english”
			else
				puts “Go out and relax something”
			end
			Output: Continue to learn english

	* SWITCH: We use switch statement when we haved clear case
		syntax:
			case expression
			[when expression [, expression ...] [then]
			   code ]...
			[else
 			  code ]
			end
		example: In put number month of year, show screen numbers day of those 				month.
			m = gets.to_i
			case m
			when [1, 3, 5, 7, 9, 10, 12].include?(m)
				puts "31 day"
			when [4, 6, 8, 11].include?(m)
				puts "30 day"
			else
				puts "28 day"
			end
			Input: 2
			Output: 28 day 
####II. WHOOP
	+ whoop for single array
		systax:
			arrayA.each do |<temp_values>|
				<code>
			example:
				ary = [  "fred", 10, 3.14, "This is a string", "last element", ]
				ary.each do |i|
					puts i
				end
			example 2:
				(10..15).each do |n| 
					 print n, ' ' 
				end
	+ whoop for Multudimensional array
		systax: 
			arrayA[i,j].each do |<key>,<value>|
				<code>
			example: 
				hsh = colors = { "red" => 0xf00, "green" => 0x0f0, "blue" =>0x00f }
				hsh.each do |key, value|
					print key, " is ", value, "\n"
				end

####III. METHOD
#####1. Involk method
	Involk method uses syntax like this: object.method
#####2. Defining method
	It starts with the keyword def and ends with keyword end
	example: 
		def xin_chao
			puts “xin chao the gioi”
		end
	Output: xin chao the gioi
#####3. Parameters & arguments:
	example 1:
		def xin_chao (name)
			puts “xin chao #{name}”
		end
		xin_chao(gets.to_s)
	Input: huy
	Output:  xin chao huy
	example 2: 
		def xin_chao name
			puts “xin chao #{name}”
		end
		xin_chao gets.to_s
	Input: huy
	Output:  xin chao huy
		

			



