mobile_number="7421291364"
if !!( mobile_number.match(/^[9,8,7].*\d{9}/))
    puts "valid mobile number"
else
    puts "invalid mobile number"
end

email_address="juleepgunjal25@gmail.com"
if !!(email_address.match(/\A[\w.+-]+@\w+\.\w+\z/))
    puts "valid email address"
else
    puts "invalid email address"
end

name="Julee@"
if !!(name.match(/^[A-Za-z]+$/))
    puts "valid name"
else
    puts "invalid name"
end

gender="F"
if !!(gender.match(/^[M,F]{1}$/))
    puts "valid gender name"
else
    puts "invalid gender name"
end

ammount="12345687"
if !!(ammount.match(/^\d+$/))
    puts "valid ammount"
else
    puts "invalid ammount"
end