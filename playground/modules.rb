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
    puts "I'm not Leopold! Ha!"
  end
end

mo.print_name
