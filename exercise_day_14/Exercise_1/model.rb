#Ham maxIDFootballTeam dung de lay id lon nhat cua football_tearm trong csdl

class Football
	attr_reader :name, :id, :score
 	def initialize(id,name,score)
    @id, @name, @score = id, name, score
 	end
end

#Ham inputListToDB dung de nhap mot mang co san vao trong database
# => argument1 arr: mang co san du lieu muon nhap vao
# => argument2 hash: nhap mang vao 1 hash de xu ly cac nhiem vu phia sau
def inputListToDB arr, hash
	maxID = maxIDFootballTeam
	arr.map do |i|
		maxID+=1
		query = "insert into football_tearm(id_team, name_team, seed) values (%d, '%s', %s)" % [maxID, i.at(0), i.at(1)]
		@client.query(query)
		hash[maxID.to_s] = i
	end	
end


def maxIDFootballTeam
	results = @client.query("SELECT max(id_team) as max from football_tearm")	
	return results.first["max"].to_i
end	