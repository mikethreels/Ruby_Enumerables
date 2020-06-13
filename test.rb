require_relative 'enumerals.rb'

my_array = [5, 4, 3, 2, 1]
my_hash = { a: 'a', b: 'b' }
arg = proc { |x| x**2 }
res = []

# p my_array.my_each
p(my_array.my_each { |value| p value + 1 })
# p(my_hash.my_each { |value| value + 1 })
p(my_array.each { |value| p value + 1 })
# p my_hash.each { |x| p res << x[1] }
# p (1..5).each { |x| res << x }
# p my_array.each

# p my_hash.to_a



# p(my_array.my_each_with_index { |value, i| puts value, i })
# p(my_array.my_select { |value| value > 3 })
# p(my_array.my_all? { |value| value > 3 })
# p(my_array.my_any? { |value| value > 6 })
# p(my_array.my_none? { |value| value > 6 })
# p(my_array.my_count { |value| value > 3 })
# p(my_array.my_map(arg) { |value| value * 2 })
# p(my_array.my_inject { |value| value * 2 })
# my_array.multiply_els
