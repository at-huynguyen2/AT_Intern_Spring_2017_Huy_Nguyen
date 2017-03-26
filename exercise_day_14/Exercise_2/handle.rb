require 'nokogiri'
require 'open-uri'
require 'pry'
require './openuri'


def calculatorScore(arr)
		sumScore = 0
		arr.each do |i|		
			arrSub = i.split('–')
			if arrSub.size != 1
				score1 = arrSub[0].to_i
				score2 = arrSub[1].to_i				
				sumScore +=3 if score1 > score2				
				sumScore +=1 if score1 == score2
			end
		end	
		return sumScore	
end

def sortByResult hash
	arrResult = Array.new
	hash.each do |k, v|
		arrResult<<[k, calculatorScore(v)]
	end
	#arrResult.sort_by{|i|i[1]}.reverse
	arrResult.sort_by!{|i|i[1]}.reverse!
	return arrResult
end

# def combineArr hashRow, hashCol
# 	hashRow.each do |k, v|
# 		binding.pry
# 		hashRow[k] = v + hashCol[k]
# 	end
# 	return hashRow
# end

def showResulf arr
	format = '| %-5s | %-22s | %-5s |'
	puts "------------------------------------------"
	puts format % ['Pos', 'Team', 'Pts']
	puts "------------------------------------------"
	pos = 1
	arr.each do |i|
			puts format % [pos, i[0], i[1]]
			pos+=1
	end
	puts "------------------------------------------"
end
# $combineArr = getDataToHash
# arr = sortByResult $combineArr if $combineArr != nil
# showResulf arr 	if arr!=nil	

$combineArr = getDataToHash
arr = sortByResult $combineArr if $combineArr != nil
showResulf arr 	if arr!=nil	
binding.pry