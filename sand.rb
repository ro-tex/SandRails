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

# This allows a file to be used as a library, and not to execute code in that context,
# but if the file is being used as an executable, then execute that code.
if __FILE__ == $0

	#g = Greeter.new "Andy"
	#g.hi
	#g.class.whoami
	#g.name = "a"
	#puts g.name

	puts ">>> Playing around with arrays and loops <<<"
	arr = ["a", "b", "c"]

	if arr.respond_to?("each") # THIS CHECKS IF WE CAN ITERATE OVER THE COLLECTION WITH EACH! OMFG!
		arr.each do |e|
			puts e + " in a loop"
		end
	else
		puts "arr is not each-able. This is what it looks like: " + arr.to_s
	end

	puts "This is a joined list: #{arr.join(", ")}" # notice the quotes in quotes!

	puts "Duck typing: #{arr}"

	arr = nil
	puts "arr is nil" if arr.nil? # trailing if demo
	puts !arr.nil? && arr.length > 0 ? ("arr len is " + arr.length.to_s) : "empty" # shorthand if works

end



