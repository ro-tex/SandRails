# if you want to turn this into a script:
# !/usr/bin/env ruby
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
  CONSTANT = 'constant'.freeze # but only as a convention

  # How do you define a class variable?
  @@my_name = 'Groot'

  # constructor
  def initialize(name = 'World')
    @name = name.capitalize
  end

  # getter, called when `puts greet.name` is used
  def name
      p 'getter called'
    results = '--> ' + @name + ' <--'
  end

  # setter, called when `greet.name = 'new name'` is used
  def name=(name)
      p 'setter called'
    @name = name.capitalize
  end

  # static
  def self.whoami
    puts 'I am ' + @@my_name + '!'
  end

  def hi
    puts "Hello #{@name}"
  end

  def bye
    puts "Bye #{@name}"
  end

  def self.foo
    puts Lib.foo
  end
end


# greet = Greeter.new
# Greeter.all
# Greeter.where(name: 'Groot', instance_variable: 'instance')

# Greeter.foo # this is how we use libraries

# This allows a file to be used both as a library and as an executable
# but only execute a given code block when called as an executable.
if $PROGRAM_NAME == __FILE__
  puts 'Our sand.rb is being used directly - as an executable file.'
end

g = Greeter.new 'Andy'
# g.hi
# g.class.whoami
# g.name = "a"
# puts g.name

if false # basics
  arr = %w[a b c] # delimiters: !, {, [, (, <.

  if arr.respond_to?('each') # THIS CHECKS IF WE CAN ITERATE OVER THE COLLECTION WITH EACH! OMFG!
    arr.each do |e|
      puts e + ' in a loop'
    end
  else
    puts "arr is not each-able. This is what it looks like: #{arr}"
  end

  puts "This is a joined list: #{arr.join(', ')}" # notice the quotes in quotes!

  puts "Duck typing: #{arr}"

  arr = nil
  puts 'arr is nil' if arr.nil? # trailing 'if' demo
  puts 'trailing unless' unless false

  # this form would also work, should you need to use it (mutiline as well):
  # foo = if arr.nil? then 'bar' else arr end

  unless false
    # keep this comment, so Rubocop doesn't turn this into a trailing unless
    puts 'regular unless'
  end

  puts defined?(arr) && !arr.nil? ? ('arr len is ' + arr.length.to_s) : 'empty' # shorthand if works

  (1...3).each { |a| puts a } # ranges that exclude the end value (use .. to include it):

  20.step(1, -3) { |x| puts x } # a fully crontolled for loop: from.step(to, step)

  { 'a' => 1, 'b' => 3 }.each { |k, v| puts "key #{k} -> value #{v}" } # hashes
  { a: 1, b: 3 }.each { |k, v| puts "key #{k} -> value #{v}" } # hashes

  foo = 'asdf'
  # a nice, flexible switch... erm... case
  case foo
  when nil
    puts 'foo is nil!'
  when 1..5
    puts 'foo is between one and five'
  when 'asdf', 'asdfg' then puts foo # if we want it on a single line
  else
    puts 'none of the above'
  end

end # basics


if false # exceptions and control

  for i in 1..5
    # next: Jumps to next iteration of the most internal loop.
    # Terminates execution of a block if called within a block (with yield or call returning nil).
    next if i == 2 # aka 'continue'

    if $! == 'bla' # if the last raised exception is 'bla' redo the innermost loop
      # Restarts this iteration of the most internal loop, without checking loop condition.
      # Restarts yield or call if called within a block.
      redo # like a 'retry' but for loops
    end
  end

  # try-catch-finally / begin-rescue-ensure:
  begin
    # do_something that might raise an exception
    rescue
        # handle error - last exception is in '$!'
        retry # restart from beginning - similar to redo
    else
      # this is only executed if no exceptions were raised in the main block.
      # very convenient to have sensitive logic here and init section in main
      # so you'd only execute the sensitive part if the init was successful
    ensure
    # Ruby's 'finally'
  end

  throw :lablename if true # true is the condition
  # .. this will not be executed
  catch :lablename do
    # .. matching catch will be executed after a throw is encountered.
  end

end # exceptions_and_control


if false # multi-dimentional returns and processing

  # define a method that returns a value
  def get_arr
    a1 = [1, 2, 3]
    a2 = [4, 5, 6]
    a3 = [7, 8, 9]
    [a1, a2, a3]
  end

  # easy iteration over multidimensional data structures
  get_arr.each do |b1, b2, b3|
    puts "#{b1} # #{b2} # #{b3}"
  end

  def return_many
      return 1, 2, 3 # return multiple values
  end

  a, b, c = return_many # assign them to many variables
  rets = return_many    # or to a single one and get an array

end


defined? $LAST_READ_LINE # always true

n = 1_024 # underscores are ignored in integers

a = 1
b = 1.0
c = 1.0
a == b      # true  (compare by value)
a.eql?(b)   # false (compare by value and type)
b.eql?(c)   # true  (compare by value and type)
b.equal?(c) # false (compare by object identity)

=begin
This is how
you make
a multiline comment
in Ruby.
=end

def tag_list=(value) # a setter
  # The '&:' in the map means that it will call a class method called 'strip' on each value.
  # A shorthand for map{|x| x.class.strip(x)}
  self.tags = value.split(',').map(&:strip)
end

a ||= {} # conditional initialisation - nothing happens if already initialised

# variable number of arguments
def foo(*args)
  ap arr args
end

alias bar foo # pointer to a function. points to the original function even after foo is overridden

undef foo # remove foo but bar is still callable

# after_initialize do |space| # this is a post-construction hook in Rails
#   space.description = space.alt_name if !space.alt_name.nil? and space.alt_name.size > 0
# end


if false # Blocks

  def block
    puts ' === block === '
    yield 1
    yield 2, 3 # the second param will be ignored in a block with a single param (won't loop)
    yield
    puts ' === end === '
  end
  block { |val| puts "Block with value #{val}" } # this line is the call, i.e. executes the function

  def foo(x)
    puts ' === foo === '

    unless block_given?
      puts "no block, x is #{x}"
      puts ' === end === '
      return
    end

    puts "outside #{x}"
    yield x
    puts "outside #{x}" # x can't be changed in the block
    yield x

    puts ' === end === '
  end
  foo(1) # Try without giving a block
  foo(1) { |n| n += 10; puts "in da block: #{n}" } # Executes foo but can't change the local variable x

  l = ->(n) { n += 20; puts "in da lambda: #{n}" }
  foo(1, &l) # This is the most functional bit - passing a named lambda

end


if false # Modules

  module Mod1
    CONST1 = 12_345
    def foo
      puts "Mod1 #{CONST1}"
    end
  end

  module Mod2
    CONST2 = 54_321
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


if false # String ops
  puts %{this is a string} # delimiters: !, {, [, (, <.
  puts %q(this is a single-quoted string: #{1+2+3})
  puts %Q(this is a double-quoted string: #{1+2+3})
  puts %x{ls -lh} # this string is the output of the command
  puts ' lala   '.strip # remove whitespaces
  puts 'abcdefg'[2..5] # "cdef" - substring
  puts 'abcdefg'[2, 5] # "cdefg" - offset, length
  puts 'abcdefg'[-5, 2] # negative fixnum starts from the end
  puts 'abcdefg'[/bcd/] # substring by regex

  'abc'.is_a?(String) # typeof check
  'abc'.instance_of? String
  'abc'.respond_to?(:to_s) # Duck typing, if it quacks like a string then it's a string

  'abc'.inspect # Returns a printable version of str, with special characters escaped.
  'abc'.intern === 'abc'.to_sym # Returns the Symbol corresponding to str, creating the symbol if it did not previously exist.
  'abc'.scan('a') { |match| puts match }
end # String ops


# demonstrate the order of operations when running a chain of select-map-reduce
if false
    puts (1..3).map { |x| puts "first map #{x}"; x * 2 }.select { |x| puts "select #{x}"; x < 5 }.map { |x| puts "second map #{x}"; x * 3 }.reduce(100) { |x, y| x + y }
end
