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
	def initialize(id,name,seed)
		@id, @name, @seed = id, name, seed
	end
	def getID
		@id
	end
	def getName
		@name
	end
	def getSeed
		@seed
	end
end

$number_team = 16

#insert football_tearm into database
def insertNumber obj
	p obj.getName
	#query = "insert into football_tearm(id_team, name_team, seed) values ('.obj.getID.', "'.obj.getName.'", "'.obj.getSeed.'")"
	query = "insert into football_tearm(id_team, name_team, seed) values (%d, '%s', %s)" % [obj.getID, obj.getName, obj.getSeed]
	p query
	return isSuccess = @client.query(query)
end

def maxIDFootballTeam
		results = @client.query("SELECT max(id_team) as max from football_tearm")	
		results.each do |row|
	 		return row["max"].to_i  
		end
		#return results.first["max"].to_i
	end

#input array from database
def inputArrayFromDB arr
	results = client.query("SELECT id_team, name_team, seed football_tearm")
	results.each do |row|
		ob = FootballTeam.new(row["id_team"].to_i, row["name_team"].to_s, row["seed"].to_i)
	 	arr.push(ob) 
	end
	return arr
end

	############
	
=begin
def inputListToDB 
	$number_team
	loop do 
		puts "Input numbers football team (number must divisible for 4):  "
		$number_team = gets.to_i
		break if $number_team%4==0
	end


	(1..$number_team).each do |i|
		puts "   * Information team #{i}"
		puts "     - name : "
		name = gets.to_s
		puts "     - seed(input Y to choose seed team else everything key to choose normal team) : "
		seed = (gets.to_s.upcase == "Y")?1:0
		maxID = maxIDFootballTeam + 1
		objTeam = FootballTeam.new(maxID, name, seed)
		insertNumber objTeam
	end
	
end
=end

#Hien thi doi bong theo bang
def showAllTeam hash
	format = '| %-5s | %-25s | %-15s|'
	puts "------------------------------------------------------"
	puts format % ['ID', 'Football name', 'Seed', 'Type', 'Role', 'Age']
	puts "------------------------------------------------------"
	#arr.map do |i|
	#	puts format % [ i.at(0), i.at(1), ((i.at(2) == 1)?("true"):("-"))]		
	#end
	hash.each do |key, value|
		puts format % [ key, value.at(0), ((value.at(1) == 1)?("true"):("-"))]
	end	
	puts "-----------------------------------------------------"
end

#Score for doi
def scoreForTeam arr
end

def chooseGroup hash
	#chia 16 doi thanh 16/4 thanh 4 bang
	#vong lap 4 lan lap. moi lan la moi bang.
	#moi bang chua 2 tran(array 2 chieu)
	#moi trang chua 2 doi va ti so
	countItem = 1
	allGroup = hash.length/4
	countGroup = 1

	while countGroup <= allGroup do 
		puts " * Group #{countGroup}"
		puts " * * Input battle 1!"
		print "   1. Id team 1 :    "
		id11 = gets.to_i
		#at_i => at_s beacause: at_s chua dau ket thuc chuoi '/n'
		print "      Score team 1:  "
		score11 = gets.to_i
		print "   2. ID team 2 :    "
		id12 = gets.to_i
		print "      Score team 1:  "
		score12 = gets.to_i
		#p teamNextRound = (score1>score2)?("more"):("less")
		teamNextRound1 = (score11>score12)?(hash[id11.to_s].at(0)):(hash[id12.to_s].at(0))
		puts "    * Results of battle 1: "
		puts "     #{hash[id11.to_s].at(0)} - #{score11} : #{score12} - #{hash[id12.to_s].at(0)} => #{teamNextRound1} go into "
		#####################################################
		puts " * * Input battle 2!"
		print "   1. Id team 1 :    "
		id21 = gets.to_i
		print "      Score team 1:  "
		score21 = gets.to_i
		#nhap id cuoi cung cung bang
		id22 = checkIdTeamEnd [id11, id12, id21]
		print "      Score team 2:  "		
		score22 = gets.to_i
		teamNextRound2 = (score21>score22)?(hash[id21.to_s].at(0)):(hash[id22.to_s].at(0))
		puts "    * Results of battle 1: "
		puts "     #{hash[id21.to_s].at(0)} - #{score21} : #{score22} - #{hash[id22.to_s].at(0)} => #{teamNextRound2} go into "
		#arrayCupple[countItem, 1]
		#cho chon 3 doi dau. doi cuoi dua ra goi y
		countGroup+=1
		break 
		
	end
end
#=begin
def isSeedNormalInGroup (arr)
	#return 1 neu chua co doi seed
	#return -1 neu chua co doi normal
	#return 0 neu da co 2 doi
	countSeed = 0
	countNormal = 0	
	arr.map do |i|
		if i == 1
			countSeed+=1
		else
			countNormal+=1
		end
	end
	return -1 if (countNormal == 0)
	return 1 if (countSeed == 0)
	return 2 if(countSeed != 0 || countNormal != 0)	
end
#Goi y tat ca doi co the nhap. Hien thi doi seed neu condition = 1, nguoc lai la -1
#Return mang chua cac doi duoc cho phep
def showSuggest condition
	arraySuggestID = Array.new
	puts "Suggest: You must choose in follow table: "
	format = '| %-5s | %-25s |'
	puts "----------------------------------------"
	puts format % ['ID', 'Football name']
	puts "----------------------------------------"	
	if condition == 1
		@hash_drop.each do |key, value|
			if value.at(1) == 1
				arraySuggestID.push(key)			 
				puts format % [ key, value.at(0)] 
			end
		end	
	else
		@hash_drop.each do |key, value|	
			if value.at(1) == 0
				arraySuggestID.push(key)		 
				puts format % [ key, value.at(0)] 
			end
		end	
	end
	puts "------------------------------------------"
	return arraySuggestID
end

def checkIdTeamEnd arrNewInput
	#xoa cac phan tu da nhap trong tong doi bong
	@hash_drop.delete(arrNewInput[0].to_s)
	@hash_drop.delete(arrNewInput[1].to_s)
	@hash_drop.delete(arrNewInput[2].to_s)	
	#kiem tra trong mang co doi seed chua	
	#truong hop 1: 3 doi vua nhap vao khong co doi seed
	isCheck = isSeedNormalInGroup(arrNewInput)
	id22 = 0
	if  isCheck == 1	#chua co doi seed
		arrayAlow = showSuggest 1 
		
		loop do
			print "   1. Id team 2 :    "
			id22 = gets.to_i
			isExit = false
			arrayAlow.each do |i|
				#kiem tra neu doi duoc chon nam trong mang duoc cho phep thi thoat! neu khong thi phai nhap lai
				if arrayAlow.include? id22
					isExit = true
					break
				end
				binding.pry
			end
			binding.pry
			break if isExit == true
		end
		binding.pry
		return id22
		#bat dau nhap
	elsif isCheck == -1
		arrayAlow = showSuggest -1
		loop do
			print "   1. Id team 2 :    "
			id22 = gets.to_i
			isExit = false
			arrayAlow.each do |i|
				if arrayAlow.include? id22
					isExit = true
					break
				end
			end
			break if isExit == true
		end
		return id22
	else
		print "   1. Id team 2 :    "
		id22 = gets.to_i
		return id22 if @hash_drop.key?(id22.to_s)
	end
	#print "   1. Id team 1 :    "
	#id21 = gets.to_i
	@hash_drop
end
#=end

=begin
ob1=FootballTeam.new(1, "Everton", 0)
ob2=FootballTeam.new(2, "Arsenal", 1)
ob3=FootballTeam.new(3, "Liverpool", 1)
ob4=FootballTeam.new(4, "Ipswich Town", 0)
ob5=FootballTeam.new(5, "Manchester United", 1)
ob6=FootballTeam.new(6, "Leeds United", 0)
ob7=FootballTeam.new(7, "West Ham United", 1)
ob8=FootballTeam.new(8, "Basa", 1)
ob9=FootballTeam.new(9, "Manchester City", 1)
ob10=FootballTeam.new(10, "Burnley", 0)
ob11=FootballTeam.new(11, "Blackburn Rovers", 0)
ob12=FootballTeam.new(12, "Chelsea", 1)
ob13=FootballTeam.new(13, "Watford", 1)
ob14=FootballTeam.new(14, "Leicester City", 0)
ob15=FootballTeam.new(15, "Hull City", 0)
ob16=FootballTeam.new(16, "Tottenham Hotspur", 1)
arr = [ob1 ,ob2 ,ob3 ,ob4 ,ob5 ,ob6 ,ob7 ,ob8 ,ob9 ,ob10 ,ob11 ,ob12 ,ob13 ,ob14, ob15 ,ob16]
puts arr
inputListToDB arr
=end

=begin
ob1=[1, "Everton", 0]
ob2=[2, "Arsenal", 1]
ob3=[3, "Liverpool", 1]
ob4=[4, "Ipswich Town", 0]
ob5=[5, "Manchester United", 1]
ob6=[6, "Leeds United", 0]
ob7=[7, "West Ham United", 1]
ob8=[8, "Basa", 1]
ob9=[9, "Manchester City", 1]
ob10=[10, "Burnley", 0]
ob11=[11, "Blackburn Rovers", 0]
ob12=[12, "Chelsea", 1]
ob13=[13, "Watford", 1]
ob14=[14, "Leicester City", 0]
ob15=[15, "Hull City", 0]
ob16=[16, "Tottenham Hotspur", 1]
arr = [ob1 ,ob2 ,ob3 ,ob4 ,ob5 ,ob6 ,ob7 ,ob8 ,ob9 ,ob10 ,ob11 ,ob12 ,ob13 ,ob14, ob15 ,ob16]
#puts arr
=end
#inputListToDB arr

ob1=["Everton", 0]
ob2=["Arsenal", 1]
ob3=["Liverpool", 1]
ob4=["Ipswich Town", 0]
ob5=["Manchester United", 1]
ob6=["Leeds United", 0]
ob7=["West Ham United", 1]
ob8=["Basa", 1]
ob9=["Manchester City", 1]
ob10=["Burnley", 0]
ob11=["Blackburn Rovers", 0]
ob12=["Chelsea", 1]
ob13=["Watford", 1]
ob14=["Leicester City", 0]
ob15=["Hull City", 0]
ob16=["Tottenham Hotspur", 1]
hash = {
	"1" =>  ob1,
	"2" =>  ob2,
	"3" =>  ob3,
	"4" =>  ob4,
	"5" =>  ob5,
	"6" =>  ob6,
	"7" =>  ob7,
	"8" =>  ob8,
	"9" =>  ob9,
	"10" =>  ob10,
	"11" =>  ob11,
	"12" =>  ob12,
	"13" =>  ob13,
	"14" =>  ob14,
	"15" =>  ob15,
	"16" =>  ob16
}
@hash_drop = {
	"1" =>  ob1,
	"2" =>  ob2,
	"3" =>  ob3,
	"4" =>  ob4,
	"5" =>  ob5,
	"6" =>  ob6,
	"7" =>  ob7,
	"8" =>  ob8,
	"9" =>  ob9,
	"10" =>  ob10,
	"11" =>  ob11,
	"12" =>  ob12,
	"13" =>  ob13,
	"14" =>  ob14,
	"15" =>  ob15,
	"16" =>  ob16
}
#puts hash[1.to_s].at(0)
showAllTeam hash
chooseGroup hash






