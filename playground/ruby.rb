def positional a, b=2, *c # b is optional, c is a splat (aka array)
	puts "#{a} | #{b} | #{c}"
end

positional 1
positional 1, 2
positional 1, 2, 3
positional 1, 2, 3, 4
puts '----------------'

def named a:, b:, c: 1024 # c: is optional
	puts "#{a} | #{b} | #{c}"
end

named b: 2, a: 1, c: 3
named b: 2, a: 1
puts '----------------'

def double_splat **par # double splat (aka hash)
	puts par
end

double_splat a: 1, b: 2
puts '----------------'


def combined_splat *single, **double # we can mix but single splat goes before double
	puts "#{single} | #{double}"
end

combined_splat 1, 2, 3, a: 1, b: 2 # order is important - positional before named
puts '----------------'

def get_block &b # This gets a block as a param and turns it into a proc, so you can .call it.
	print b.class
	b.call
end

get_block { puts ' | >>> This is printed from a block. <<< ' }


def get_proc
	yield if block_given?
end

p = Proc.new { puts 'Hi from a proc.'}
get_proc &p # converting a proc into a block
puts '----------------'




puts "\n\n\n"