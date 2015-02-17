# using sqlite3 with ruby

require 'rubygems'
require 'sqlite3'

# check to see whether sqlite3 is installed and ready for use
# puts "it's all okay" if defined?(SQLite3::Database)

# creates a new database file 'dbfile' in the same directory, where our SQLite database will be saved
$db = SQLite3::Database.new("dbfile")
# forces SQLite to return data in a hash format rather than as an array
$db.results_as_hash = true

# close $db file:
def disconnect_and_quit
	$db.close
	puts "Bye!"
	exit
end

# create a table using SQL language in ruby:
# varchar(50) means it is a variable length character field that can contain strings
def create_table
	puts "creating people table"
	$db.execute %q{
		CREATE TABLE people (
			id integer primary key,
			name varchar(50),
			job varchar(50),
			gender varchar(50),
			age integer

			)
	}
end

# add a new person to the database:
def add_person
	puts "name:"
	name = gets.chomp
	puts "job:"
	job = gets.chomp
	puts "gender:"
	gender = gets.chomp
	puts "age:"
	age = gets.chomp
	$db.execute("INSERT INTO people (name, job, gender, age) VALUES (?, ?, ?, ?)", name, job, gender, age)
end

# find a person within a created table
def find_person
	puts "Enter person name or ID:"
	id = gets.chomp
	# a match on either the name OR the id will work
	person = $db.execute("SELECT * FROM people WHERE name = ? OR id = ?", id, id.to_i).first

	# if no person is found, the program ends early
	unless person
		puts "No result found"
		return
	end

	puts "Name: #{person['name']}"
	puts "Job: #{person['job']}"
	puts "gender: #{person['gender']}"
	puts "age: #{person['age']}"
end

# loop engine, user interface for interaction with the methods
loop do 
	puts %q{Please select an option:
		1. Create people table
		2. Add a person
		3. Look for a person
		4. Quit}

	case gets.chomp
		when '1'
			create_table
		when '2'
			add_person
		when '3'
			find_person
		when '4'
			disconnect_and_quit
	end
end




