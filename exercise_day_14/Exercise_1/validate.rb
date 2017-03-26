
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
		if @hash_main[i].seed == 1
			countSeed+=1
		else
			countNormal+=1
		end
	end
	return -1 if (countNormal == 0)
	return 1 if (countSeed == 0)
	return 2 if(countSeed != 0 || countNormal != 0)	
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
			print "   1. Id team 2 :    "
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
		print "   1. Id team 2 :    "
		id22 = gets.to_s.chomp
		id22 = inputID123 id22, 2, arrEntered, originHash
		return id22 if @hash_main.key?(id22)
	end
	@hash_main
end