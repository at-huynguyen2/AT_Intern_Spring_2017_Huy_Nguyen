#Ham maxIDFootballTeam dung de lay id lon nhat cua football_tearm trong csdl

class Football
	attr_reader :name, :id, :seed
 	def initialize(id,name,seed)
    @id, @name, @seed = id, name, seed
 	end
end

#Ham inputListToDB dung de nhap mot mang co san vao trong database
# => argument1 arr: mang co san du lieu muon nhap vao
# => argument2 hash: nhap mang vao 1 hash de xu ly cac nhiem vu phia sau
def inputListToDB hash
	begin
		maxID = maxIDFootballTeam
		hash.each do |k,v|
			query = "insert into football_tearm(id_team, name_team, seed) values (%d, '%s', %s)" % [v.id, v.name, v.seed]
		 	@client.query(query)
		end
	rescue Exception => e
		puts e.message
		puts "Can not insert database, Please wait and try again after"
	end
end


def maxIDFootballTeam
	begin
		results = @client.query("SELECT max(id_team) as max from football_tearm")	
		return results.first["max"].to_i
	rescue Exception => e
		puts e.message
		puts "Can not insert database, Please wait and try again after"
	end
end	