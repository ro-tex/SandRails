$LOAD_PATH << '.'

require 'gecko'

class ModuleUser
  include Gecko

  def print_name
    puts NAME # Gecko::NAME because it's included!
  end
end

ModuleUser.new.print_name
