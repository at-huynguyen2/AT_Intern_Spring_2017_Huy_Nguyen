require 'pry'
require 'active_support/all'
class Report
  def initialize(path)
    binding.pry
    @path = path
  end
  def read_file
    binding.pry
    @report_file = File.new("#{Time.now.to_s(:number)}"+".txt", "w+")
    f = File.open(@path,"r+")
    f.each do |line|
      @report_file.write(line + "\n")
    end
  end

  def input_report
    #begin 
      read_file
      line = 1
      while true do
        write_report_to_file(line)
        line += 1
        select = gets.chomp
        case select
        when 'n'
          puts 'Please check your input file in this path: #{@path}'
        else
        end
      end
    #rescue => e
    #  puts e.message
    #end
  end

  def write_report_to_file(line, file_name)
    title = "Please input your line #{line.ordinalize}: "
    puts title
    report_string = gets.chomp
    @report_file.write(title + "\\n")
    @report_file.write(report_string "n")
    puts "Do you want to input #{(line+1).ordinalize}?"
  end
end
puts "Input your info file path: "
path = gets.chomp
Report.new(path).input_report
