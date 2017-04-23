# function exportfile: use to write file
# => argument1 arr: to show result output console terminal.

def exportfile arr
  begin
    file = File.open("result.txt", "w")
    text = showResulf arr
    file.puts text
    file.close
    # binding.pry
  rescue IOError => e
    puts "Can not write file. Please try again after there."
  ensure
    file.close unless file.nil?
  end
end



