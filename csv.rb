# text file database creating using a csv file

require 'csv'

# File modes:
# 'r': read-only, the pointer is placed at the start of the file
# 'r+': both reading and writing allowed, file pointer is placed at the start of the file
# 'w': write-only. a new file is created (or an old one overwritten as if new)
# 'w+': both reading and writing are allowed, but File.new creates a new file from scratch (or overwrites an old on as if new)
# 'a': write (in append mode). pointer is placed at the end of the file and writes will make it longer
# 'a+': both reading and writing allowed in append mode. the file pointer is placed at the end of the file and writes will make the file longer
# 'b': Binary file mode (only required on Windows). You can use it in conjunction with any of the other modes listed


# Reading data from a CSV file:
#CSV.open('csvfile.txt','r') { |person| puts person.inspect }
CSV.open('csvfile.txt','r').each { |person| puts person }
puts
CSV.open('csvfile.txt','r').each { |person| puts person.inspect }
puts
CSV.open('csvfile.txt','r').each { |person| puts person[0] }

puts
people = CSV.parse(File.read('csvfile.txt'))
puts people[0]
puts
puts people[0][0]
puts
lebron = people.find {|person| person[0] =~ /Lebron/}
puts lebron.inspect


# saving data back to a CSV file (open in write access)
# Changing Lebrons name to Tim Taylor, age to 99
lebron[0] = "Tim Taylor"
lebron[1] = 99
CSV.open('csvfile.txt','w') do |csv|
	people.each do |person|
		csv << person
	end
end









