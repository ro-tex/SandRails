require 'benchmark'
require 'bigdecimal/math'

# Measure a single block of code
puts Benchmark.measure { BigMath.PI(10_000) }
puts "\n"

iterations = 100_000
padding = 30

# Measure and compare different approaches
Benchmark.bm(padding) do |bm|
  # joining an array of strings
  bm.report('joining an array of strings') do
    iterations.times do
      ['The', 'current', 'time', 'is', Time.now].join(' ')
    end
  end

  # using string interpolation
  bm.report('string interpolation') do
    iterations.times do
      "The current time is #{Time.now}"
    end
  end
end

puts "\n\n"

array = Array(1..10_000_000)

# The method name is suitable because it actually benchmarks your blocks of code twice.
# First, it runs the code as a ‘rehearsal to force any initialization that needs to happen,
# then it forces the GC to run, then it runs the benchmark again ‘for real. This ensures
# that the system is fully initialized and the benchmark is fair.
Benchmark.bmbm(7) do |bm|
  bm.report('reverse') do
    array.dup.reverse
  end

  bm.report('reverse!') do
    array.dup.reverse!
  end
end
