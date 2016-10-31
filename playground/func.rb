
class Array
  def foo
    each { |x| yield x.to_i }
  end

  def bar(proc)
    map { |x| proc.call x }
  end
end

# a method that returns a proc
def surround_with(sym)
  proc { |x| "#{sym}#{x}#{sym}" }
end

quote = surround_with('"')
sharp = surround_with('#')

arr = [1, 2, 3, 'i', '123', nil]
arr.foo { |n| puts n * n } # pass a block to the method call
puts arr.bar(quote)
puts arr.bar(sharp)
