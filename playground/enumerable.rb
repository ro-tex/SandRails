arr = [1, 3, 5, 2, 2, 3, 3, 4]

arr.all?(&:odd?) # no space before the ()!!!

# can't use shorthand blocks with methods that require params
arr.all? { |a| a.is_a? Numeric }

arr.chunk(&:odd?).each { |condition, segment| [condition, segment] }

arr.count(&:odd?)

arr.cycle(3) { |x| x * x if x == 5 } # processes the array three times in a row

arr.detect(&:odd?) # returns the first found
call_if_nothing_found = -> { 'nope, nothing found!' }
arr.find(call_if_nothing_found) { |n| n < 0 } # gets a function as param

(1..10).drop 3 # just drops the first three elements
arr.drop_while { |n| n < 3 } # stops after the first element that doesn't first

# without a block these return enumerators:
(1..10).each_cons(3) { |mini_arr| mini_arr } # [1, 2, 3], [2, 3, 4], ..
(1..10).each_slice(3) { |mini_arr| mini_arr } # [1, 2, 3], [4, 5, 6], ..

('a'..'f').each_with_index { |item, index| "#{index}: #{item}" }

# this one is very useful for aggregations and selections - it loops the collection
# and then returns the object we've passed as parameter. so it can hold the state
obj = []
(1..10).each_with_object(obj) { |item, object_arr| object_arr << item }

(1..10).find_all(&:odd?)
(1..10).select(&:odd?)
(1..10).reject(&:even?)
