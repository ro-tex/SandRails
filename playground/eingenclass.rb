# http://www.integralist.co.uk/posts/eigenclass.html

# We'll reopen String and add some nice callbacks!
class String
  # These below will only be active for the eigenclass object
  class <<self
    def singleton_method_added(id)
      puts ">> Adding #{id.id2name}..."
    end

    def singleton_method_removed(id)
      puts ">> Removing #{id.id2name}..."
    end

    def singleton_method_undefined(id)
      puts ">> Undef-ing #{id.id2name}..."
    end
  end

  # We need to add them to the regular class as well, if we want them active for the class's instances
  def singleton_method_added(id)
    puts "*** Adding #{id.id2name}... ***"
  end

  def singleton_method_removed(id)
    puts "*** Removing #{id.id2name}... ***"
  end

  def singleton_method_undefined(id)
    puts "*** Undef-ing #{id.id2name}... ***"
  end
end

class String
  def imp
    self + '!'
  end

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

############################################################

class String
  class <<self
    remove_method :o
  end
end

s.instance_eval { undef :very_imp }
