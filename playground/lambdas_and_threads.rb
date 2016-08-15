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
