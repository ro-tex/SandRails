
class Array
  def foo
    each { |x| yield x.to_i }
  end

  def bar(proc)
    map { |x| proc.call x }
  end
end

quote = proc { |x| "'#{x}'" }

arr = [1, 2, 3, 'i', '123', nil]
arr.foo { |n| puts n * n } # pass a block to the method call
puts arr.bar(quote)
