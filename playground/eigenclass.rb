# http://www.integralist.co.uk/posts/eigenclass.html
# https://www.sitepoint.com/premium/screencasts/learning-about-the-uses-of-singleton-methods-in-ruby

# We'll reopen String and add some nice callbacks!
# Those callbacks are active for the scope where we define them:
# 1. the class: those will trigger when we add a singleton method to instances of the class
# 2. the class's own singleton object: then those will trigger when we add singleton methods
#   to the class itself. Note: class methods *are* singleton methods.
class String
  class << self
    # These below will only be active for the eigenclass object
    def singleton_method_added(id)
      puts "String class >> Adding #{id.id2name}..."
    end

    def singleton_method_removed(id)
      puts "String class >> Removing #{id.id2name}..."
    end

    def singleton_method_undefined(id)
      puts "String class >> Undef-ing #{id.id2name}..."
    end
  end

  # These will be active for instances of the class
  def singleton_method_added(id)
    puts "String object ## Adding #{id.id2name}..."
  end

  def singleton_method_removed(id)
    puts "String object ## Removing #{id.id2name}..."
  end

  def singleton_method_undefined(id)
    puts "String object ## Undef-ing #{id.id2name}..."
  end
end

class String
  def imp
    self + '!'
  end

  # singleton for the class's eigenclass object
  def self.o
    'Ooh!'
  end
end

s = 'someting'
r = 'something else'
puts s.imp
puts r.imp

# This is a singleton method - it only exists for this one object
def s.very_imp
  self + '!!!'
end

puts s.very_imp
# puts r.very_imp # -> Error: undefined method `very_imp' for "something else":String (NoMethodError)

# This is the way to find all singleton methods for an object
puts s.singleton_methods.inspect
puts String.singleton_methods.inspect

# this is how we de-register a class singleton
class String
  class <<self
    remove_method :o
  end
end

# another way to execute something in the context of a class is this:
String.class_exec { remove_method :imp }

# A interesting distinction between remove_method and undef_method is that
# remove_method strips only the method provided in the current class but not
# the methods with the same name inherited from parents. Now, undef_method does
# something slightly different - it prevents the given method from being called
# at all. The current class's method cannot be called, parents' methods with that
# name cannot be called, even send doesn't work. Really effective.

# and this is how we de-register an object's singleton
s.instance_eval { undef :very_imp }
