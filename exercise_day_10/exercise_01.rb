
def checkValidatePwd 
	puts "Input password that you want check validate: "
	pwd = gets.chomp
	pwd = ~ /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{6,}$/ ? true : false
	if (pwd == true)
		puts "Your password is validate. ^^!"
	else
		puts "Your password isn't validate!!"
	end
end

checkValidatePwd