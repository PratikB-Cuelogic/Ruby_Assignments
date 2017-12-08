require 'csv'
require'date'
data= CSV.read("Employee.csv",{encoding:"UTF-8",headers:true,header_converters: :symbol,converters: :all})
hash_data=data.map{|d| d.to_hash}
#puts hash_data

#List of employees
puts
puts "****List of employees***"
=begin
len=hash_data.length
for i in (0...len)
  hash_data[i].each do |key, value|
    print  key,'=',value
    puts
  end
  puts
end
=end
def disp_details(d)
  d.each do
  |key,value|
    print  key,'=',value,'  '
  end
end
hash_data.select{ |d| disp_details(d)
puts}

puts

#Max Age from list of employees
puts"********Max age Among list of Employees********"

x = hash_data.max_by { |e| e[:age] }
print 'The Maximum age is: ', x[:age]
puts
print 'Name of Employee:   ',x[:name]
puts puts

#Comparison of Date
puts "****List of Employees who have joined in last 6 months****"
hash_data.select{ |d|
  if Date.parse(d[:date]) > Date.today-180
 disp_details(d)
    puts
  end
}
puts puts


#Verdict of Each Employee
puts "****Verdict of Each Employee****"
hash_data.select{ |d| disp_details(d)
message=case d[:yrs_in_months]
  when 0...7
    "verdict: fresher"
  when 6...25
    "verdict: beginner"
  when 25...49
    "verdict: implementer"
  else 36
    "verdict: expert"
end
  puts message
}

puts puts
#Max Age from list of employees
puts"********Dept Wise Employees********"
dept = hash_data.group_by { |e| e[:description] }
dept.each do |key,value|
    print  key,'=:'
    puts
    dept[key].each do |k,v|
      print k,'=',v
      puts
    end
  puts
end

