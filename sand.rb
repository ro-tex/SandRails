# if you want to turn this into a script:
#!/usr/bin/env ruby
# or this: #!/usr/bin/ruby

$LOAD_PATH << '.' # tells Ruby to look for files in the current dir

require 'lib'

class Greeter

  # define default getter and setter, just like making the field public
  # if you define custom getters they will override the defaults, ofc.
  attr_accessor :name

  # Variables:
  local_variable = 'local'
  @instance_variable = 'instance'
  @@class_variable = 'class'
  $global_variable = 'global'
  CONSTANT = 'constant' # but only as a convention

  #How do you define a class variable?
  @@my_name = "Groot"

  # constructor
  def initialize(name = "World")
    @name = name.capitalize
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
    puts "I am " + @@my_name + "!"
  end

  def hi
    puts "Hello #{@name.capitalize}"
  end

  def bye
    puts "Bye #{@name.capitalize}"
  end

  def self.foo
    puts Lib.foo
  end

end

#Greeter.all
#Greeter.where(name: 'Groot', instance_variable: 'instance')

#Greeter.foo # this is how we use libraries

# This allows a file to be used as a library, and not to execute code in that context,
# but if the file is being used as an executable, then execute that code.
if __FILE__ == $0
  #puts 'Our sand.rb is being used directly - as an executable file.'
end

g = Greeter.new "Andy"
#g.hi
#g.class.whoami
#g.name = "a"
#puts g.name

if false # basics
  arr = ["a", "b", "c"]

  if arr.respond_to?("each") # THIS CHECKS IF WE CAN ITERATE OVER THE COLLECTION WITH EACH! OMFG!
    arr.each do |e|
      puts e + " in a loop"
    end
  else
    puts "arr is not each-able. This is what it looks like: #{arr}"
  end

  puts "This is a joined list: #{arr.join(", ")}" # notice the quotes in quotes!

  puts "Duck typing: #{arr}"

  arr = nil
  puts "arr is nil" if arr.nil? # trailing if demo
  puts 'trailing unless' unless false

  unless false
    puts 'regular unless'
  end

  puts !arr.nil? && arr.length > 0 ? ("arr len is " + arr.length.to_s) : "empty" # shorthand if works

  (1...3).each { |a| puts a } # ranges that exclude the end value (use .. to include it):
  
  20.step(1, -3) {|x| puts x} # a fully crontolled for loop: from.step(to, step)

  {"a" => 1, "b" => 3}.each { |k, v| puts "key #{k} -> value #{v}" } # hashes

  arr = "asdf"
  # a nice, flexible switch... erm... case
  case arr
  when nil
    puts "arr is nil!"
    #when 1..5: puts "arr is one"
  when "asdf", "asdfg" then puts arr
  else
    puts "none of the above"
  end
end # basics

if false # exceptions_and_control

  for i in 1..5
    # do nothing
    next if i == 2 # aka 'continue'
    #next: Jumps to next iteration of the most internal loop. Terminates execution of a block if called within a block (with yield or call returning nil).

    if $! == "bla" # if the last raised exception is 'bla' redo the innermost loop
      redo # Restarts this iteration of the most internal loop, without checking loop condition. Restarts yield or call if called within a block.
    end
  end

  # try-catch-retry:
  begin
    # do_something # exception raised
  rescue
    # handles error - last exception is in $!
    retry # restart from beginning - similar to redo
  end

  for i in 1..5
    #retry if false # restart from i == 1
  end

end # exceptions_and_control

if false # multi-dimentional returns and processing

  #define a method that returns a value
  def get_arr
    a1 = [1, 2, 3]
    a2 = [4, 5, 6]
    a3 = [7, 8, 9]
    return [a1, a2, a3]
  end

  # easy iteration over multidimensional data structures
  get_arr.each do |b1, b2, b3|
    puts "#{b1} # #{b2} # #{b3}"
  end

end

defined? $_ #always true

n = 1_024 # underscores are ignored in integers

a = 1
b = 1.0
c = 1.0
a == b # true
a.eql?(b) # false
b.eql?(c) # true
b.equal?(c) # false, if different objects

=begin
This is how
you make
a multiline comment
in Ruby.
=end

def tag_list= value # I guess a way to define a param?
  self.tags = value.split(',').map(&:strip) # why do we need the &? how does map work? what's :strip, exactly?
end

a ||= {} # conditional initialisation - nothing happens if already initialised

def foo(*args) ap arr args end # variable number of arguments

alias bar foo # pointer to a function. points to the original function even after foo is overridden

undef foo # remove foo but bar is still callable

# after_initialize do |space| # this is a post-construction hook
#   space.description = space.alt_name if !space.alt_name.nil? and space.alt_name.size > 0
# end

if true # Blocks

  def block
    puts ' === block === '
    yield 1
    yield 2, 3
    yield
    puts ' === end === '
  end
  block { |val| puts "Block with value #{val}"} # this line is the call, i.e. executes the function

  def foo x
    puts ' === foo === '

    unless block_given?
      puts "no block, x is #{x}"
      puts ' === end === '
      return
    end

    puts "outside #{x}"
    yield x
    puts "outside #{x}"
    yield x

    puts ' === end === '
  end
  foo(1) # Try without giving a block
  foo(1) { |n| n += 10; puts "in da block: #{n}" } # Executes foo but can't change the local variable x
  l = -> n { n += 20; puts "in da lambda: #{n}"}
  foo(1, &l) # This is the most functional bit - passing a named lambda

end

if false # Modules

  module Mod1
    CONST1 = 12345
    def foo
      puts "Mod1 #{CONST1}"
    end
  end

  module Mod2
    CONST2 = 54321
    def foo
      puts "Mod2 #{CONST2}"
    end
  end

  class C
    include Mod1
    include Mod2
  end

  C.new.foo # Mod2 is included second, so it overwrites Mod1's methods where they overlap
  puts C::CONST1
  puts C::CONST2

end # Modules

# String ops
if false
  # puts %{this is a string} # delimiters: !, {, [, (, <.
  # puts %q(this is a single-quoted string: #{1+2+3})
  # puts %Q(this is a double-quoted string: #{1+2+3})
  # puts %x{ls -lh} # this string is the output of the command
  puts " lala   ".strip # remove whitespaces
  puts "abcdefg"[2..5] # "cdef" - substring
  puts "abcdefg"[2, 5] # "cdefg" - offset, length
  puts "abcdefg"[-5, 2] # negative fixnum starts from the end
  puts "abcdefg"[/bcd/] # substring by regex

  "abc".is_a?(String) # typeof check
  "abc".instance_of? String
  "abc".respond_to?(:to_s) # Duck typing, if it qucks like a string then it's a string

  "abc".inspect # Returns a printable version of str, with special characters escaped.
  "abc".intern === "abc".to_sym # Returns the Symbol corresponding to str, creating the symbol if it did not previously exist.
  "abc".scan('a') {|match| puts match}
end

















