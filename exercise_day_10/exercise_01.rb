
def checkValidatePwd 
	puts "Input password that you want check validate: "
	pwd = gets.chomp
	pwd = ~ /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{6,}$/ ? true : false
	(pwd == true)? (puts "Your password is validate. ^^!") : (puts "Your password isn't validate!!")	
end

checkValidatePwd