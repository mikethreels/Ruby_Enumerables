require_relative 'enumerals.rb'

my_array = [5, 4, 3, 2, 1]
arg = proc { |x| x**2 }
my_hash = { a: 1, b: 2 }
my_text = %w[ant bear cat]

# p(my_array.my_each { |value| p value })
# p(my_hash.my_each { |value| p value })
# p((1..10).my_each { |value| p value })

# p(my_array.my_each_with_index { |value, i| puts value, i })
# p(my_hash.my_each_with_index { |value, i| p value, i})
# p((1..10).my_each_with_index { |value, i| p value, i})

# p(my_array.my_select { |value| value > 3 })
# p(my_hash.my_select { |key, value| value > 1 })
# p((1..10).my_select { |value| value > 6 })


# p my_text.my_all?(/t/)
# p my_array.my_all?(Numeric)
# p my_array.my_all?
# p(my_array.my_all? { |value| value >= 2 })
# p(my_text.my_all?(/t/) { |value| value >= 2 })


# p my_text.my_any?(/t/)
# p my_array.my_any?(Numeric)
# p my_array.my_any?
p(my_array.my_any? { |value| value > 10 })
p(my_text.my_any?(/t/) { |value| value >= 2 })


# p(my_array.my_any? { |value| value > 6 })
# p(my_array.my_none? { |value| value > 6 })
# p(my_array.my_count { |value| value > 3 })
# p(my_array.my_map(arg) { |value| value * 2 })
# p(my_array.my_inject { |value| value * 2 })
# my_array.multiply_els
