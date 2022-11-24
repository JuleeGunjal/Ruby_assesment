
class ClassRoom
  #class instance variable
  @@class_rooms = 0

  #constructor 
  def initialize(capacity, students, teacher, projector, board)
      @capacity = capacity
      @students = students
      @teacher = teacher
      @projector = projector
      @board = board
      @available = false
      @class_room_number = @@class_rooms + 1
      @@class_rooms += 1
  end

 
#class  method
  def self.count
    @@class_rooms
  end

  #public instance method
  def vacant_class
    if is_available?  #calling private method is_available? in public method
      puts "class is already vacant"
    else
      @available=true
      "Now Class #{@class_room_number} is vacant" #accesing class instance attribute
    end
  
  end

  # getter 
  def teacher
    @teacher
  end

  def class_room_number
    @class_room_number
  end

  def students
    @students
  end

  def occupy_class(students,teacher)
    
    if is_available?
      @students = students
      @teacher = teacher
      @available = false
      "class occupied"
    else
      "Class Room is Not available"
    end
  end

  
  def carry
    if @board.upcase == "WHITE"
      puts "Carry chalk and duster"
    else
      puts "Carry pen and duster"
    end

  end

  
  def add_students(students)
    occupy_no = vacancy(students)
    if is_full?(students)
      puts "Class is full .Can occupy only #{occupy_no}"
    else
      @students = @students + students
      puts "Occupied"
    end
  end

  #declaring private methods
  private

  #setters
  def students=(students)
    @students = students
  end

  def teacher=(teacher)
    @teacher = teacher
  end

  def is_available?
     @available
  end

  def is_full?(students)
    if @capacity < students 
      true
    else
      false
    end
  end

  def vacancy (students)
      sum = @students + students
      diff = @capacity - @students
      occupy_no = students - diff
  
  end

end

classA = ClassRoom.new(60,40,"Megha","No","White")
classB = ClassRoom.new(50,50,"Rahul","No","green")
#puts classA.is_available?
puts ClassRoom.count
puts classA.class_room_number
puts classB.vacant_class
puts classB.occupy_class(40,"Jay")
puts classB.teacher
puts classA.carry
puts classA.add_students(20)
puts classA.students