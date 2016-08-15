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

  private

  def self.not_so_private_name
    puts 'This is actually accessible (private class method)'
  end
end

# print 'direct: '; Private.print_name_private # This throws an error, as it should!
print 'via getter: '; Private.expose_private_name
print 'via send: '; Private.send('print_name_private')
Private.not_so_private_name
