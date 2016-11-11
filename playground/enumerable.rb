arr = [1, 3, 5, 2, 2, 3, 3, 4]

arr.all?(&:odd?) # no space before the ()!!!

# can't use shorthand blocks with methods that require params
arr.all? { |a| a.is_a? Numeric }

arr.chunk(&:odd?).each { |condition, segment| p [condition, segment] }
