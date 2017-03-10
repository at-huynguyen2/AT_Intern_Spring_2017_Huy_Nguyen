class Add
  attr_accessor :param_1, :param_2

  def input_info
    puts "Input param1: "
    @param_1 = gets.chomp.to_i
    puts "Input param2"
    @param_2 = gets.chomp.to_i
  end

  def add
    sum = param_1+param_2
    puts "Result: "
    return puts "#{sum}"
  end
end

info = Add.new()
info.input_info
info.add