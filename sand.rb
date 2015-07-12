# if you want to turn this into a script:
#!/usr/bin/env ruby
# or this: #!/usr/bin/ruby

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

end

# This allows a file to be used as a library, and not to execute code in that context,
# but if the file is being used as an executable, then execute that code.
if __FILE__ == $0

  g = Greeter.new "Andy"
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
  puts 'trailing unless' unless false

  unless (false)
    puts 'regular unless'
  end

  puts !arr.nil? && arr.length > 0 ? ("arr len is " + arr.length.to_s) : "empty" # shorthand if works

  # ranges that exclude the end value (use .. to include it):
  (1...3).each do |a|
    puts a
  end

  # hashes
  {"a" => 1, "b" => 3}.each do |k, v|
    puts "key #{k} -> value #{v}"
  end

  arr = "asdf"
  # a nice, flexible switch... erm... case
  case arr
    when nil
      puts "arr is nil!"
    when 1
      puts "arr is one"
    when "asdf"
      puts arr
    else
      puts "none of the above"
  end

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
   retry if false # restart from i == 1
  end

  arr.nil? do
    puts "."
    arr = nil
  end

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

  defined? $_ #always true

end

BEGIN {
   puts "# Initializing the program with a BEGIN statement #"
}

END {
   puts "# Wrapping things up in an END statement #"
}

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

def self.hash_password(username, password) 
  hidden_salt = "i#p2+W~t$2=.fv&6"
  salt = "" 
  (username + hidden_salt).bytes.each do |b| salt = salt + b.to_s(16) end 
  salt = (username + hidden_salt).bytes.inject do |salt, b| salt + b.to_s(16) end 
  return Digest::SHA256.hexdigest(salt + password) 
end
