	require "mysql2"
	require "pry"

	@client = Mysql2::Client.new(
	      :host => "localhost", 
	      :port => 3306, 
	      :database => "foolball",
	      :username => "root", 
	      :password => "huy10573987",
	      :reconnect => true
	)

	def maxFootballName
		results = @client.query("SELECT max(football_ids) as max from football_name")	
		results.each do |row|
	 		return row["max"].to_i  
		end
	end

	def queryInsert(id , name)
	end

	def querySelect
		puts "List football name"
		results = @client.query("SELECT * FROM football_name")
		results.each do |row|
	 		#puts row["football_ids"]   
	 		puts "     * #{row["football_names"]} "
		end
	end
		
	def insert_while
		puts "   * Insert database use WHILE whoop!"
		puts "   * Input count football_names: "
		count = gets.to_i
		i = 0;
		while i<count do
			puts "    ---------------------------"
			puts "    Input football"
			puts "     * football name: "
			football_name = gets.to_s
			football_id = maxFootballName + 1
			i+=1
			query = "insert into football_name(football_ids, football_names) values (%d, '%s')" % [football_id, football_name]
			isSuccess = @client.query(query)
		end
	end


	def insert_Until()
		puts "   * Insert database use UNTIL whoop!"
		puts "   * Input count football_names: "
		count = gets.to_i
		i = 0;
		until i>count do
			puts "    ---------------------------"
			puts "    Input football"
			puts "     * football name: "
			football_name = gets.to_s
			football_id = maxFootballName + 1
			i+=1
			query = "insert into football_name(football_ids, football_names) values (%d, '%s')" % [football_id, football_name]
			isSuccess = @client.query(query)
		end
	end

	def insert_For()
		puts "   * Insert database use FOR whoop!"
		puts "   * Input count football_names: "
		count = gets.to_i
		for i in 0...count
			puts "    ---------------------------"
			puts "    Input football"
			puts "     * football name: "
			football_name = gets.to_s
			football_id = maxFootballName + 1
			i+=1
			query = "insert into football_name(football_ids, football_names) values (%d, '%s')" % [football_id, football_name]
			isSuccess = @client.query(query)
		end
	end




	def mainFunction()
		loop do
			puts "Input number: \n 1. Use to while \n 2. Use to Until \n 3. Use to for \n 4. Use to select all \n 5. exit "
			isNumberCheck = gets.to_i
			case isNumberCheck
				when 1
					insert_while()
				when 2
					insert_Until()
				when 3
					insert_For()
				when 4
					querySelect
			end
			break if isNumberCheck == 5
		end
	end

	mainFunction