require "pry"

module Demo
  def say_hello
    puts "hi!"
  end
end

class Box
  attr_accessor :width, :height
  include Demo
  def initialize(w, h)
    @width, @height = w, h
  end
  def info()
    p "width is #{@width}"
    p "height is #{@height}"
  end
end

module Demo
  def say_hello
    puts "hi!"
  end
end

b = Box.new(5, 10)
b.info()
b.width = 100
p b.width
p b.height
p b.say_hello