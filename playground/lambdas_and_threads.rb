# require 'parallel_minion'
# def threads
#   now = Time.now
#   threads = []
#   (0..10).each do |t|
#     threads[t] = ParallelMinion::Minion.new() do
#       calc(t, now)
#     end
#   end

#   threads.each do |tr|
#     puts tr.result
#   end
# end

# def threads2
#   now = Time.now
#   threads = []
#   (0..10).each do |t|
#     threads[t] = Thread.new() do
#       calc(t, now)
#     end
#   end

#   threads.each do |tr|
#     puts tr.join
#   end
# end

# def calc(t, time)
#   n = 0
#   while (Time.now < time + 30)
#     n += 1
#     print t
#   end
# end

# threads

def pif1 n
  puts n if yield n
end

print 'block: '
pif1(4) { |e| e % 2 == 0 }

p = proc { |e| e % 2 == 0 }

print 'proc as block: '
pif1(4, &p) # The '&' tells ruby to turn the proc into a block

print 'proc as arg: '

def pif2 n, p
  puts n if p.call n
end

pif2(4, p)

def make_lambda &bbb
  proc &bbb
end

lam = make_lambda { puts "lambda, yo!" }

lam.call

lam2 = -> (l) { puts "another #{l}, yo!" }
lam2.call(:lambda)

class Array
  def mod *a
    unless a.nil?
      puts 'monkey!'
      a.map {|x| {x => self}}
    end
  end
end

a = ['a', 'b']
b = [1, 2, 3]
puts a.mod *b # *b will unpack the array!

puts "========================\n\n"

def plus_1(y)
  x = 100
  y.call # remembers the value of x = 1
end

def get_closure
  # the returned closure will work with this variable, always
  x = 0
  -> { x += 1 }
end

y = get_closure
puts plus_1(y)
x = 1000 # this is another variable - it doesn't overrride the old x
puts plus_1(y)
puts plus_1(y)

def exec_block
  x = 200 # this doesn't affect the x in the supplied block
  yield
end

puts exec_block { x += 2 }
x = 10 # this change affects the blocks below - they use the same var x
puts exec_block { x += 2 }
puts exec_block { x += 2 }

puts "========================\n\n"

def get(y)
  x = 0 # this will be used in the lambda, unaffected by external changes
  -> { print "lambda: #{x += 1} #{y += 1}"; yield; yield; puts }
end

def get_r
  # this will *seed* the y in the lambda but then it's detached and external changes won't affect the y
  # this is because its value was snapshotted when the lambda was created
  # but changing this will affect the block!
  a = 10
  r = get(a) { print " block #{a += 2}" }

  r.call
  a = 1000 # this affects the block
  r.call
  puts a # a is affected b the operation in the block

  r
end

a = 50 # this is a different a - different cotext so it doesn't affect the creation of the lambda
rrr = get_r
rrr.call
rrr.call # these continue to increment the internal counter and keep the value affixed in the block
rrr.call