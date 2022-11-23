=begin
2. WAP for students to print their school level according to grade
e.g -
if grade is between 1-5 return elementary
if grade is between 6-8 return middle school
if grade is between 9-12 return high school
if grade is between otherwise return college
=end
def studentLevel(grade)
    case grade
    when 1..5
        return "Elementary"
    when 6..8
        return "Middle School"
    when 9..12
        return "High School"
    else
        return "College"
    end
end

puts "Enter grade of student"
grade=gets.chomp.to_i
puts studentLevel(grade)
