module Lib

  def self.foo # can use self
    return 'bar'
  end
  def Lib.bar # can also use Lib
    return 'foo'
  end
end
