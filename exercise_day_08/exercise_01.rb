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
#transaction in ruby???

class FootballTeam
	def initialize(id,name,score,seed)
		@id, @name, @score, @seed = id, name, score, seed
	end
	def getID
		@id
	end
	def getName
		@name
	end
	def getScore
		@score
	end
	def getSeed
		@seed
	end
end

def insertNumber obj
	query = "insert into football_tearm(id_team, name_team, seed, score) values (?, '?', '?', ?)" , [obj.getID, obj.getName, obj.getSeed, obj.getScore]
	p query
	return isSuccess = @client.query(query)
end

def maxIDFootballTeam
		results = @client.query("SELECT max(id_team) as max from football_tearm")	
		results.each do |row|
	 		return row["max"].to_i  
		end
	end


def createSchedule 
	$n = 4;
	loop do 
		puts "Input numbers football team (number must divisible for 4):  "
		$n = gets.to_i
		break if $n%4==0
	end

	(1..$n).each do |i|
		puts "   * Information team #{i}"
		puts "     - name : "
		name = gets.to_s
		puts "     - seed(input Y to choose seed team else everything key to choose normal team) : "
		seed = (gets.to_s.upcase == 'Y')?true:false
		puts "     - score : "
		score = gets.to_i
		maxID = maxIDFootballTeam + 1
		objTeam = FootballTeam.new(maxID, name, seed, score)
		insertNumber objTeam
	end
end

createSchedule