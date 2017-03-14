require "mysql2"
require "pry"

#client = Mysql2::Client.new(:host => "localhost", :username => "root")
@client = Mysql2::Client.new(
      :host => "localhost", 
      :port => 3306, 
      :database => "foolball",
      :username => "root", 
      :password => "huy10573987",
      :reconnect => true
)

=begin
results = client.query("SELECT * FROM football_name")
results.each do |row|
  puts row["football_ids"]   
  puts row["football_names"]   
end
=end
def maxFootballName
	results = @client.query("SELECT max(football_ids) as max from football_name")	
	results.each do |row|
 		return row["max"].to_i  
	end
end

def queryInsert(id , name)
end

def querySelect
	results = @client.query("SELECT * FROM football_name")
	results.each do |row|
 		puts row["football_ids"]   
 		puts row["football_names"]   
	end
end

def isNumber
	puts "Input count football_names: "
	count = gets.to_i
	i = 0;
	while i<count do
		puts "---------------------------"
		puts "Input football"
		puts "football id: "
		football_id = gets.to_i
		puts "football name: "
		football_name = gets.to_s

	end
end

def insert_while()

end

def insert_Until()
end

def insert_For()
end




def mainFunction()
	loop do
		puts "Input number: \n 1. Use to while \n 2. Use to Until \n 3. Use to for \n 4. Use to select all \n 5. exit "
		isNumberCheck = gets.to_i
		case isNumberCheck
			when  isNumberCheck == 1
				insert_while()
			when isNumberCheck == 2
				insert_Until()
			when isNumberCheck == 3
				insert_For()
			when isNumberCheck == 4
				querySelect
		end
		break if isNumberCheck == 5
	end
end

mainFunction