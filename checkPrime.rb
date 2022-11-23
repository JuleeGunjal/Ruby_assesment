#1. WAP to display number is prime or not

puts "Enter the number"
num=gets.chomp.to_i

def checkPrime(num)
    i=2
    is_prime=true
   while i<num do
       if num%i==0  
        is_prime=false
        break
       end
       i=i+1
    end

puts "#{is_prime}"
    if is_prime && num!=0
        puts "#{num} is  a prime number"
    else
        puts "#{num} is not a prime number"
    end
end
checkPrime(num)