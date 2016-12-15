require 'benchmark'
require 'bigdecimal/math'

# puts Benchmark.measure { BigMath.PI(10_000) }

iterations = 100_000

Benchmark.bm do |bm|
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
