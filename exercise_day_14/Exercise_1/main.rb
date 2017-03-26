require "mysql2"
require "pry"
require "./model"
require "./config"
require "./validate"
require "./ui"

ob1= Football.new 1, "Everton", 0
ob2= Football.new 2, "Arsenal", 1
ob3= Football.new 3, "Liverpool", 1
ob4= Football.new 4, "Ipswich Town", 0
ob5= Football.new 5, "Manchester United", 1
ob6= Football.new 6, "Leeds United", 0
ob7= Football.new 7, "West Ham United", 1
ob8= Football.new 8, "Basa", 1
ob9= Football.new 9, "Manchester City", 1
ob10= Football.new 10, "Burnley", 0
ob11= Football.new 11, "Blackburn Rovers", 0
ob12= Football.new 12, "Chelsea", 1
ob13= Football.new 13, "Watford", 1
ob14= Football.new 14, "Leicester City", 0
ob15= Football.new 15, "Hull City", 0
ob16= Football.new 16, "Tottenham Hotspur", 1

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
@hash_main = Hash.new
inputListToArr @hash_main
inputListToDB @hash_main
=end

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
			puts "          * #{value.name}"
		end	
		break
	end
end







