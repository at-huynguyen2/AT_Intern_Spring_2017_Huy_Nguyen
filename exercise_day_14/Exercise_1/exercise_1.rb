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
$number_team = 16
#Ham maxIDFootballTeam dung de lay id lon nhat cua football_tearm trong csdl
def maxIDFootballTeam
		results = @client.query("SELECT max(id_team) as max from football_tearm")	
		return results.first["max"].to_i
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

#Ham inputListToArr dung de nhap du lieu vao trong mang. Ham tra ve mot mang moi duoc nhap thong tin vao
def inputListToArr
	$number_team
	loop do 
		puts "Input numbers football team (number must divisible for 4):  "
		$number_team = gets.to_i
		break if $number_team%4==0
	end
	arr = Array.new

	(1..$number_team).each do |i|
		puts "   * Information team #{i}"
		puts "     - name : "
		name = gets.chomp
		puts "     - seed(input Y if choose Seed team else anykey) : "	
		seed = gets.chomp.upcase
		seed = ( seed == "Y")?1:0
		arr.push([name, seed])
	end
	return arr
end

#showAllTeam : Hien thi doi bong theo bang
# => argument1 hash: du lieu can hien thi ra man hinh
def showAllTeam hash
	format = '| %-5s | %-25s | %-15s|'
	puts "------------------------------------------------------"
	puts format % ['ID', 'Football name', 'Seed']
	puts "------------------------------------------------------"
	hash.each do |key, value|
		puts format % [ key, value.at(0), ((value.at(1) == 1)?("true"):("-"))]
	end	
	puts "-----------------------------------------------------"
end

#isNumber: kiem tra id co dung dinh dang khong? id ko co trong db, id da nhap roi, id la ky tu chu cai'
def isNumber number
	begin
	  number = Integer(number)
	rescue
	  return false
	end
	return true
end

#isExited: dung de kiem tra id co xuat hien trong mang da nhap vao chua. Ham ta ve id neu mang dung. nguoc lai ham tra ve false
# => argument1 arr: mang chua du lieu can kiem tra
# => argument2 id: mang chua id can kiem tra trong mang arr
def isExited arr, id
	return true if arr.empty?
	return false if arr.include? id
	return true
end

#chech id input? Input again if don't validate
# input123 dung de kiem tra id vua nhap vao co phai la so hay khong, co nam trong, vong dau hay khong?
# => id: id cua doi bong can kiem tra
# => index chi so cua tran dau trong mot vong ban
# => arrEntered: list cac doi bong da duoc nhap vao trong he thong
# => originHash: list tat ca doi bong trong vong bang
def inputID123 id, index, arrEntered, originHash
	loop do
		if !isNumber id
			puts "   !!!You must input key is number. Please input again!!!"
			print "      Id team #{index} :    "
			id = gets.chomp			
		else
			break
		end
	end

	loop do
		if !originHash.key?(id)
			puts "   !!!This team don't contain in team group. Please input again!!!"
			print "      Id team #{index} :    "
			id = gets.chomp
		else
			break
		end
	end

	loop do
		if !isExited arrEntered, id
			puts "   !!!You entered this team, let choose orther team. Please input again!!!"
			print "      Id team #{index} :    "
			id = gets.chomp
		else
			break
		end
	end
	return id
end
 
def inputScore score
	loop do
		if !isNumber score 
			puts "   !!!You must input validate number for score. Please input again!!!"
			print "      Please, Input again score :  "
			score = gets.chomp
		else
			return score
		end
	end
	return score
end

#inputBattel: use return number one team of group
# => argument1 isTeam4: (True/False) use to check id is team end of group when input?
# => argument2 arrEntered: use to check id entered, isn't?
# => argument3 arrIDBatte: is list contain 3 team in group
# => argument4 originHash: list all team

def inputBattle! isTeam4, arrEntered, arrIdBatte, originHash
	#kiem tra co phai thuoc team cuoi cua bang dau hay k?
	print "   1. Id team 1 :          "
		id1 = gets.to_s.chomp
		id1 = inputID123 id1, 1, arrEntered, originHash
		arrIdBatte.push(id1)
		arrEntered.push(id1)
		#at_i => at_s beacause: at_s chua dau ket thuc chuoi '/n'
		print "      Score of this team:  "
		score1 = inputScore gets.chomp

		print "   2. ID team 2 :          "
		id2 = gets.to_s.chomp
		if isTeam4 == false
			id2 = gets.to_s.chomp
		else
			id2 = checkIdTeamEnd arrEntered ,arrIdBatte, originHash
		end
		
		id2 = inputID123 id2, 2, arrEntered, originHash
		arrIdBatte.push(id2)
		arrEntered.push(id2)
		print "      Score of this team:  "
		score2 = inputScore gets.chomp
		#Vong lap kiem tra ti so. neu ti so bang nhau thi phai da tiep de tranh thang thua.
		loop do
			if score1 == score2
				puts "	* #{originHash[id1].at(0)} equal #{originHash[id2].at(0)}! Please add score next battle."
				print "        * * Score of #{originHash[id1].at(0)}: "
				addScore = gets.chomp
				#binding.pry
				#score1.to_i += addScore.to_i
				score1 = score1.to_i+addScore.to_i
				print "        * * Score of #{originHash[id2].at(0)}: "
				addScore = gets.chomp
				score2 = score2.to_i+addScore.to_i
			else 
				break
			end
		end
		idWin = (score1>score2)?id1:id2
		puts "    * Results of battle 1: "
		puts "      #{originHash[id1].at(0)} - #{score1} : #{score2} - #{originHash[id2].at(0)}"
		puts "      => #{originHash[idWin].at(0)} go in round "
		Return idWin
end


#chooseGroup: dung de phan chia cac doi thanh cac bang va loai nhung doi bong bi thua
# => argument1 hash: tat ca doi bong can phan chia thanh cac bang
def chooseGroup hash
	#chia 16 doi thanh 16/4 thanh 4 bang
	#vong lap 4 lan lap. moi lan la moi bang.
	#moi bang chua 2 tran(array 2 chieu)
	#moi trang chua 2 doi va ti so
	countItem = 1
	#So group bang tong doi bong chia cho 4
	allGroup = hash.length/4
	countGroup = 1
	if @teamNextRound.length != 0
		originHash = @teamNextRound.clone 
		@teamNextRound.clear
	else
		originHash = hash.clone
	end
	#de luu nhung doi bong da chon vao roi
	arrEntered = Array.new
	arrIdBatte = Array.new
	#nhap tung tran bong cho moi group
	while countGroup <= allGroup do 
		puts "*****************************************************"
		puts " * Group #{countGroup}"
		#Nhap ti so tran dau thu 1
		puts " * * Input battle 1!"
		idWin1 = inputBattle! false, arrEntered, arrIdBatte, originHash
		#@teamNextRound.merge!({idWin1 =>originHash[idWin1]})	

		#Nhap ti so tran dau thu 2
		puts " * * Input battle 2!"
		print "   1. Id team 1 :          "
		id21 = gets.to_s.chomp
		id21 = inputID123 id21, 1, arrEntered, originHash
		arrEntered.push(id21)
		print "      Score of this team:  "
		score21 = inputScore gets.chomp
		#nhap id cuoi cung cung bang
		id22 = checkIdTeamEnd arrEntered ,[id11, id12, id21], originHash
		arrEntered.push(id22)
		print "      Score of this team:  "		
		score22 = inputScore gets.chomp
		loop do
			if score21 == score22
				puts "	* #{originHash[id21].at(0)} equal #{originHash[id22].at(0)}! Please add score next battle."
				print "        * * Score of #{originHash[id21].at(0)}: "
				addScore = inputScore gets.chomp
				score21 = score21.to_i+addScore.to_i
				print "        * * Score of #{originHash[id22].at(0)}: "
				addScore = inputScore gets.chomp
				score22 = score22.to_i+addScore.to_i
			else 
				break
			end
		end
		idWin2 = (score21>score22)?id21:id22		
		puts "    * Results of battle 2: "
		puts "      #{originHash[id21].at(0)} - #{score21} : #{score22} - #{originHash[id22].at(0)}"
		puts "      => #{originHash[idWin2].at(0)} go in round "
		#@teamNextRound.merge!({idWin2 =>originHash[idWin2]})
		#hien thi bang ket 	qua tran dau	
		#Chon doi nhat bang
		puts "---***Choose team number one of Group #{countGroup}***---"
		print "        * * Score of #{originHash[idWin1].at(0)}: "
		scoreWin1 = inputScore gets.chomp
		print "        * * Score of #{originHash[idWin2].at(0)}: "
		scoreWin2 = inputScore gets.chomp
		idNumberOne = (scoreWin1 > scoreWin2)?idWin1:idWin2
		loop do
			if scoreWin1 == scoreWin2
				puts "	* #{originHash[idWin1].at(0)} equal #{originHash[idWin2].at(0)}! Please add score next battle."
				print "        * * Score of #{originHash[idWin1].at(0)}: "
				addScore = gets.chomp
				#binding.pry
				#score11.to_i += addScore.to_i
				scoreWin1 = scoreWin1.to_i+addScore.to_i
				print "        * * Score of #{originHash[idWin2].at(0)}: "
				addScore = gets.chomp
				scoreWin2 = scoreWin2.to_i+addScore.to_i
			else 
				break
			end
		end
		puts "      #{originHash[idWin1].at(0)} - #{scoreWin1} : #{scoreWin2} - #{originHash[idWin2].at(0)}"
		puts "      => #{originHash[idNumberOne].at(0)} go in round "
		@teamNextRound.merge!({idWin2 =>originHash[idWin2]})
		countGroup+=1
	end
	#Toi gian doi bong duoc vao vong trong

end
#=begin
#isSeedNormalInGroup: dung de kiem tra trong doi bang dau co day du doi seed va normal khong
# => argument1 arr: mang chua 3 doi bong trong bang dau vua nhap vao
#return:
# => -1: neu trong bang chua co doi normal
# => 0 : neu trong bang da co doi normal va doi seed
# => 1 : neu trong bang chua co doi seed
def isSeedNormalInGroup (arr)
	countSeed = 0
	countNormal = 0	
	arr.map do |i|
		if @hash_main[i].at(1) == 1
			countSeed+=1
		else
			countNormal+=1
		end
	end
	return -1 if (countNormal == 0)
	return 1 if (countSeed == 0)
	return 2 if(countSeed != 0 || countNormal != 0)	
end
#showSuggest: Goi y tat ca doi co the nhap
#Return mang chi chua cac doi duoc cho phep
def showSuggest condition
	arraySuggestID = Array.new
	puts "Suggest: You must choose in follow table: "
	format = '| %-5s | %-25s |'
	puts "-------------------------------------"
	puts format % ['ID', 'Football name']
	puts "-------------------------------------"	
	if condition == 1
		@hash_main.each do |key, value|
			if value.at(1) == 1
				arraySuggestID.push(key)			 
				puts format % [ key, value.at(0)] 
			end
		end	
	else
		@hash_main.each do |key, value|	
			if value.at(1) == 0
				arraySuggestID.push(key)		 
				puts format % [ key, value.at(0)] 
			end
		end	
	end
	puts "---------------------------------------"
	return arraySuggestID
end

#Ham checkIdTeamEnd
# => argument 1: nhung doi bong da nhap vao trong tat ca cac ban, dung de kiem tra co doi nhap vao co trung hay chua
# => argument 2: nhung doi da nhap vao trong vong ban dang nhap. gom 3 id la id11, id12, id23
# 				dung de kiem tra trong bang da co doi seed hay doi normal chua
# => argument 3: tat ca doi bong trong vong bang. dung de kiem tra id nhap vao co ton tai trong vong bang hay khong?
#return: sau khi kiem tra thi tra ve id cua doi bong cuoi cung cua bang

def checkIdTeamEnd arrEntered , arrNewInput, originHash	
	#kiem tra trong mang co doi seed chua	
	isCheck = isSeedNormalInGroup(arrNewInput)
	id22 = 0
	if  isCheck == 1	#chua co doi seed
		arrAlow = showSuggest 1 		
		loop do
			print "   1. Id team 2 :          "
			id22 = gets.to_s.chomp
			id22 = inputID123 id22, 2, arrEntered, originHash
			binding.pry
			arrEntered.push(id22)
			#bien isInArrAlow kiem tra xem id vua nhap vao co nam trong mang de nghi hay khong?
			isInArrAlow = arrAlow.include? id22
			if isInArrAlow
				break
			else
				puts "   !!!This team must in suggest array!!!"
			end			
			break if isInArrAlow == true
		end
		return id22
		#bat dau nhap
	elsif isCheck == -1	#chua co doi normal
		arrAlow = showSuggest -1
		loop do
			print "   1. Id team 2 :         "
			id22 = gets.to_s.chomp
			id22 = inputID123 id22, 2, arrEntered, originHash
			arrEntered.push(id22)
			isExit = false
			arrAlow.each do |i|
				if arrAlow.include? id22
					isExit = true
					break
				end
			end
			break if isExit == true
		end
		return id22
	else				#da co 2 doi seed va normal
		print "   1. Id team 2 :            "
		id22 = gets.to_s.chomp
		id22 = inputID123 id22, 2, arrEntered, originHash
		return id22 if @hash_main.key?(id22)
	end
	@hash_main
end

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
$number_team = 16
@hash_main = {
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
=begin
#use to input information of all team into array
@hash_main.clear
arrMain = inputListToArr
inputListToDB arrMain, @hash_main
=end

#=begin
@teamNextRound = Hash.new
showAllTeam @hash_main
chooseGroup @hash_main
loop do
	if @teamNextRound.size >2
		puts "The teams go into round is:"
		showAllTeam @teamNextRound
		chooseGroup @teamNextRound
	else
		puts "   ---***--Teams OF Semi final round---***----"
		@teamNextRound.each do |key, value|
			puts "          * #{value.at(0)}"
		end	
		#format = '        %-25s vs %-15s|'
		#puts format % [Hash[@teamNextRound.first].at(0), Hash[@teamNextRound.at(1)].at(0)]
		break
	end
end
#=end







