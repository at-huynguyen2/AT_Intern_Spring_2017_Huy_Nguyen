require 'nokogiri'
require 'open-uri'
require 'pry'
require './openuri'

# calculatorScore: use to calculator score
# Rule: win will add 3 point, 
# => argument 1 arr: list team need calculator
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

# function sortByResult: use sort by team follow total point
# => argument1  hash: need sort by
def sortByResult hash
	arrResult = Array.new
	hash.each do |k, v|
		arrResult<<[k, calculatorScore(v)]
	end
	#arrResult.sort_by{|i|i[1]}.reverse
	arrResult.sort_by!{|i|i[1]}.reverse!
	return arrResult
end

# => showResult arr use show result of all team include column pos, team, pts
# => argument 1 arr: is array result after we calculatored
# => function return writefile: is value to export file
def showResulf arr		
	format = '| %-5s | %-22s | %-5s |'
	puts "------------------------------------------"
	puts format % ['Pos', 'Team', 'Pts']
	puts "------------------------------------------"
	pos = 1
	#writefile: is value to export file
	writefile = "Ket qua giai dau la:"
	writefile += format % ["Pos", "Team", "Pts"] + "\n"
	writefile += "------------------------------------------"

	arr.each do |i|
			puts format % [pos, i[0], i[1]]
			writefile += format % [pos, i[0], i[1]] + "\n"
			pos+=1
	end
	puts "------------------------------------------"
	binding.pry
	return writefile
end
# $combineArr = getDataToHash
# arr = sortByResult $combineArr if $combineArr != nil
# showResulf arr 	if arr!=nil	

