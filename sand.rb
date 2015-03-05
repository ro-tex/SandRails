# if you want to turn this into a script:
#!/usr/bin/env ruby

class Greeter

	# define default getter and setter, just like making the field public
	# if you define custom getters they will override the defaults, ofc.
	attr_accessor :name

	# constructor
	def initialize(name = "World")
		self.name = name
	end

	# getter
	def name
		results = "--> " + @name + " <--"
	end

	#setter
	def name=(name)
		@name = name.capitalize
	end

	# static
	def self.whoami
		puts "I am Groot!"
	end

	def hi
		puts "Hello #{@name.capitalize}"
	end

	def bye
		puts "Bye #{@name.capitalize}"
	end

end

g = Greeter.new("Andy", "Rudy", "Seth")

#g.hi
#g.class.whoami
#puts Greeter.instance_methods
#puts Greeter.to_s
#g.name = "a"

puts g.name
