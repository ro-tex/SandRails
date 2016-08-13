$LOAD_PATH << './playground'

require 'gecko'

class ModuleUser
  include Gecko

  def print_name
    puts NAME # Gecko::NAME because it's included!
  end
end

mo = ModuleUser.new
mo.print_name

# On the fly object rewriting! Mind = blown! Hadn't seen this fucked up shit since Perl days.
class << mo
  def print_name
    puts "I'm not #{NAME}! Ha! (overloading the method within the Singleton class)"
  end
end

def mo.print_real_name
  puts 'Pinky and no(t) Brain! (Singleton method)'
end

mo.print_name
mo.print_real_name
