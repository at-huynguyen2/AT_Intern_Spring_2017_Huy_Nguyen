
#Ham inputListToArr dung de nhap du lieu vao trong mang. Ham tra ve mot mang moi duoc nhap thong tin vao
def inputListToArr hash
	$number_team
	loop do 
		puts "Input numbers football team (number must divisible for 4):  "
		$number_team = gets.to_i
		break if $number_team%4==0
	end
	maxID = maxIDFootballTeam	

	(1..$number_team).each do |i|
		puts "   * Information team #{i}"
		puts "     - name : "
		name = gets.chomp
		puts "     - seed(input Y if choose Seed team else anykey) : "	
		seed = gets.chomp.upcase
		seed = ( seed == "Y")?1:0
		maxID+=1
		hash.merge!({maxID => Football.new(maxID, name, seed)})
	end
end

#showAllTeam : Hien thi doi bong theo bang
# => argument1 hash: du lieu can hien thi ra man hinh
def showAllTeam hash
	format = '| %-5s | %-25s | %-15s|'
	puts "------------------------------------------------------"
	puts format % ['ID', 'Football name', 'Seed']
	puts "------------------------------------------------------"
	hash.each do |key, value|
		puts format % [ key, value.name, ((value.seed == 1)?("true"):("-"))]
	end	
	puts "-----------------------------------------------------"
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
			# binding.pry
			if value.seed == 1
				arraySuggestID.push(key)			 
				puts format % [ key, value.name] 
			end
		end	
	else
		@hash_main.each do |key, value|	
			if value.seed == 0
				arraySuggestID.push(key)		 
				puts format % [ key, value.name] 
			end
		end	
	end
	puts "---------------------------------------"
	return arraySuggestID
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
	#nhap tung tran bong cho moi group
	while countGroup <= allGroup do 
		puts "*****************************************************"
		puts " * Group #{countGroup}"
		#Nhap ti so tran dau thu 1
		puts " * * Input battle 1!"
		print "   1. Id team 1 :          "
		id11 = gets.to_s.chomp
		id11 = inputID123 id11, 1, arrEntered, originHash
		arrEntered.push(id11)
		#at_i => at_s beacause: at_s chua dau ket thuc chuoi '/n'
		print "      Score of this team:  "
		score11 = inputScore gets.chomp

		print "   2. ID team 2 :          "
		id12 = gets.to_s.chomp
		id12 = inputID123 id12, 2, arrEntered, originHash
		arrEntered.push(id12)
		print "      Score of this team:  "
		score12 = inputScore gets.chomp
		#Vong lap kiem tra ti so. neu ti so bang nhau thi phai da tiep de tranh thang thua.
		loop do
			if score11 == score12
				puts "	* #{originHash[id11].name} equal #{originHash[id12].name}! Please add score next battle."
				print "        * * Score of #{originHash[id11].name}: "
				addScore = gets.chomp
				#binding.pry
				#score11.to_i += addScore.to_i
				score11 = score11.to_i+addScore.to_i
				print "        * * Score of #{originHash[id12].name}: "
				addScore = gets.chomp
				score12 = score12.to_i+addScore.to_i
			else 
				break
			end
		end
		idWin1 = (score11>score12)?id11:id12
		teamWin1 = originHash[idWin1].name
		puts "    * Results of battle 1: "
		puts "      #{originHash[id11].name} - #{score11} : #{score12} - #{originHash[id12].name}"
		puts "      => #{teamWin1} go in round "
		@teamNextRound.merge!({idWin1 =>originHash[idWin1]})	

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
				puts "	* #{originHash[id21].name} equal #{originHash[id22].name}! Please add score next battle."
				print "        * * Score of #{originHash[id21].name}: "
				addScore = gets.chomp
				score21 = score21.to_i+addScore.to_i
				print "        * * Score of #{originHash[id22].name}: "
				addScore = gets.chomp
				score22 = score22.to_i+addScore.to_i
			else 
				break
			end
		end
		idWin2 = (score21>score22)?id21:id22
		teamWin2 = originHash[idWin2].name
		puts "    * Results of battle 1: "
		puts "      #{originHash[id21].name} - #{score21} : #{score22} - #{originHash[id22].name}"
		puts "      => #{teamWin2} go in round "
		@teamNextRound.merge!({idWin2 =>originHash[idWin2]})
		#hien thi bang ket 	qua tran dau	
		countGroup+=1
	end
	#Toi gian doi bong duoc vao vong trong

end