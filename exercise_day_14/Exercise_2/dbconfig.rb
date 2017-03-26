require "mysql2"
@client = Mysql2::Client.new(
      :host => "localhost", 
      :port => 3306, 
      :database => "foolball",
      :username => "root", 
      :password => "huy10573987",
      :reconnect => true
)

def maxIDFootballTeam
	results = @client.query("SELECT max(id_team) as max from football_tearm").first["max"].to_i
end	

def inputListToDB arr
	begin
		maxID = maxIDFootballTeam
		arr.each do |item|		
			query = "insert into football_tearm(id_team, name_team, score) values (%d, '%s', %s)" % [maxID+=1, item[0], item[1]]
		 	@client.query(query)
		end
	rescue Exception => e
			e.message
			puts "Can not insert database, Please wait and try again after"
	end
end
