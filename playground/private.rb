class Private
  class << self # Opening the so-called Eigenclass
    def expose_private_name # The getter needs to be in the Eigenclass as well!
      print_name_private
    end

    private

    def print_name_private # An almost fully private class method - only accessible via 'send'
      puts 'Zis ist meine sekret name!'
    end
  end

  def self.another_getter # public getter
    another_fully_private
  end

  def self.another_fully_private # this will be private soon
    puts 'I\'m private! Look at me priviting all over the place!'
  end

  private_class_method :another_fully_private

  private

  def self.not_so_private_name
    puts 'This is actually accessible (private class method) from anywhere.'
  end
end

if $PROGRAM_NAME == __FILE__

  # print 'direct: '; Private.print_name_private # This throws an error, as it should!
  print 'via getter: '; Private.expose_private_name
  print 'via send: '; Private.send('print_name_private')
  Private.not_so_private_name

  puts
  # print 'direct: '; Private.another_fully_private # This throws an error, as it should!
  print 'via getter: '; Private.another_getter
  print 'via send: '; Private.send 'another_fully_private'

end
