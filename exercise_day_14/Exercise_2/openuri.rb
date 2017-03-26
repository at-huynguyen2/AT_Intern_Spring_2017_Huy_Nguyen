# def getDataToHash hash
# 	begin 
# 		countRow = 0
# 		countCol = 0
# 		html = open('https://en.wikipedia.org/wiki/2015-16_Premier_League#League_table_60')
# 		doc = Nokogiri::HTML(html.read)
# 		doc.encoding = 'utf-8'
# 		countRow = doc.css("table.wikitable.plainrowheaders th[scope='row'] a").size
# 		countRow -=1
# 		(0..countRow).each do |i|
# 				arr = Array.new
# 				if i==0
# 					rand1=0
# 					rand2=19
# 				else
# 					rand1 =(i)*20
# 					rand2 = rand1+19
# 				end			
# 				arr = doc.css("table.wikitable.plainrowheaders td")[rand1..rand2].map{|k|k.text}						
# 				key = doc.css("table.wikitable.plainrowheaders th[scope='row'] a")[i].text
# 				#hash[:key] = arr
# 				hash.merge!({key => arr})
# 		end
# 		return hash
# 	rescue => e
# 		puts e
# 		puts e.class
# 		puts "You check again connect to internet or effect url"	
# 		return nil		
# 	end	
# end

def getDataToHash
	# begin 
		hashCol = Hash.new
		hashRow = Hash.new
		countTeam = 0
		html = open('https://en.wikipedia.org/wiki/2015-16_Premier_League#League_table_60')
		doc = Nokogiri::HTML(html.read)
		doc.encoding = 'utf-8'
		countTeam = doc.css("table.wikitable.plainrowheaders th[scope='row'] a").size
		countTeam -=1
		(0..countTeam).each do |i|
				arr = Array.new				
				rand1 =(i)*20
				rand2 = rand1+19		
				arr = doc.css("table.wikitable.plainrowheaders td")[rand1..rand2].map{|k|k.text}						
				key = doc.css("table.wikitable.plainrowheaders th[scope='row'] a")[i].text
				#hash[:key] = arr
				hashRow.merge!({key => arr})
		end

		##############################
		i = 0
		while i<=countTeam do
			arrScore = Array.new
			j=0			
			while j<=countTeam do				
				# rand1 = i+20*j
				arrScore<<doc.css("table.wikitable.plainrowheaders td")[i+20*j].text
				j+=1
			end
			# binding.pry
			key = doc.css("table.wikitable.plainrowheaders th[scope='row'] a")[i].text 
			hashCol.merge!({key => arrScore})
			i+=1
		end
		# combine 2 array: hashRow and hashCol to 1 array
		hashRow.each do |k, v|
			hashRow[k] = hashRow[k] + hashCol[k]	
		end
		return hashRow
	# rescue => e
	# 	puts e.message
	# 	puts "You check again connect to internet or effect url"	
	# 	return nil		
	# end	
end