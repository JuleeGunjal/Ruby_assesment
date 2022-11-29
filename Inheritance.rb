module Animal
  def locomotion
    puts "#{@name} is able to move from one place to another...from Animal"
  end
  def heterogenous
    puts "#{@name} unable to produce own food...from Animal"
  end
end

module Chordata
  prepend Animal
  def is_backbone?
    puts 'It has a backbone...from Chordata'
  end
end

class Mammalia
  attr_accessor :name
  include Chordata
  def initialize(name)
    @name = name
    puts 'In mammels class'
  end
  def able_to_give_birth?
    puts 'This is able to give birth to child...from mammel'
  end
end

class  Cat < Mammalia
  def initialize(name)
    super(name)
    puts "In Cat class"
  end
  def is_domestic?
    puts "#{@name} is domestic animal..... from Cat"
  end
  def singeton_test
    puts "singleton behaviour for Cat generalize #{@name}"
  end
end

class Monotremes < Mammalia
  def initialize(name)
    super(name)
    puts "In Monotremes class"
  end
  def able_to_give_birth?
    puts 'This is unable to give birth to child.It lays egg...from Monotremes'
  end
  def is_domestic?
    puts "#{@name} is wild animal....from Monotremes"
  end
end


cat = Cat.new('Jerry')
#Cat->Mammalia->Animal->Chordata
cat.locomotion
#Cat->Mammalia->Animal->Chordata
cat.is_backbone?
#Cat->Mammalia
cat.able_to_give_birth?
#Local instance method from Cat
cat.is_domestic?
#to check the ancestors history
puts Cat.ancestors
print "\n"
#mamallia->Monotremes
monotremes = Monotremes.new('mono')
#Animal->Chordata->mamallia->Monotremes
monotremes.locomotion
# Chordata->mamallia->Monotremes
monotremes.is_backbone?
#local method from Monotremes is called
monotremes.able_to_give_birth?
monotremes.is_domestic?
print "\n"
# Singleton method for Cat class
cat2 = Cat.new('Mau')
cat3 = Cat.new('Rani')
#redefine the singleton_test method for cat3 object
def cat3.singeton_test
  puts "redefined the singleton test for #{@name}"
end
cat3.singeton_test
cat2.singeton_test