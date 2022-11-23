
puts "Enter Ip address"
ip_address=gets.chomp
pattern=ip_address.match(/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/)
arr_ip=ip_address.split(".")

ranges=arr_ip[0].to_i
def addressClass(ranges)
    case ranges
    when 0..127
        return "A class"
    when 128..191
        return "B class"
    when 192..223
        return "c class"
    else
        return "Invalid IP address"
    end
end
if pattern
puts addressClass(ranges)
else
    puts "please provide valid ip address"
end
