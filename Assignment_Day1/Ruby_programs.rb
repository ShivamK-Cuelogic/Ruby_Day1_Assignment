require 'csv'
require 'date'
records=[]

#Reading value from CSV file into hash
CSV.foreach("test.csv") do |row|
  myhash={}
  myhash[:emp_code] =row[0]
  myhash[:name]=row[1]
  myhash[:age]=row[2]
  myhash[:dept]=row[3]
  myhash[:experience]=row[4]
  myhash[:Doj]=row[5]
  records.push(myhash)
end

#printing values from hash and assigning verdict
len=records.length-1
for i in (0..len)
  records[i].each do |key,value|
    print " #{key} = #{value}  "
  end
  exp=records[i][:experience].to_i
  verdict=case exp
            when (0..6) then "Fresher"
            when (7..18) then "beginner"
            when (19..36) then "Implementer"
            else "Expert"
          end
  print "verdict=",verdict
  puts
end

#finding highest age
puts " Highest Age Employee details"
highest_age=records.max_by{|hash| hash[:age] }
highest_age.each do |key,value|
  print " #{key} = #{value} "
end
puts
#Employees who joined in last six months
puts "\nEmployees who joined in last 6 months\n"
last_six_month_joined=records.select{|hash| Date.parse(hash[:Doj]) > Date.parse("2017-05-07") }
for i in (0..last_six_month_joined.length-1)
  last_six_month_joined[i].each do |k2,v2|
    print " #{k2} = #{v2} "
  end
  puts
end

=begin
#Printing records by grouping dept
dept=["Tech","HR","Finance"]
dept.each do |d|
  tech=records.select{|hash| hash[:dept]=="#{d}"}
  puts "\nEmployees from #{d} Dept \n"
  for i in (0..tech.length-1)
  tech[i].each do |key,value|
    print " #{key} = #{value} "
  end
    puts
end
end
=end

#Printing records by grouping dept
v=records.group_by{|d| d[:dept]}
v.each do |key,value|
  puts "\nFrom #{key} Dept\n"
  for i in (0..value.length-1)
    value[i].each do |k1,v1|
      print " #{k1} = #{v1} "
    end

  end
end
