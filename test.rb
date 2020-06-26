require_relative 'enumerals.rb'

# my_array = [5, 4, 3, 2, 1]
# arg = proc { |x| x**2 }
# my_hash = { a: 1, b: 2 }
# my_text = %w[ant bear cat]

# puts '---------------------------my_each'
# p(my_array.my_each { |value| p value })
# p(my_hash.my_each { |value| p value })
# p((1..10).my_each { |value| p value })
# p my_array.my_each

# puts '---------------------------my_each_with_index'
# p(my_array.my_each_with_index { |value, i| puts value, i })
# p(my_hash.my_each_with_index { |value, i| p value, i })
# p((1..10).my_each_with_index { |value, i| p value, i })

# puts '---------------------------my_select'
# p(my_array.my_select { |value| value > 3 })
# p(my_hash.my_select { |_key, value| value > 1 })
# p((1..10).my_select { |value| value > 6 })

# puts '---------------------------my_all?'
# p(my_text.my_all?(/t/))
# p(my_array.my_all?(Numeric))
# p(my_array.my_all?)
# p(my_array.my_all? { |value| value >= 2 })
# p(my_text.my_all?(/t/) { |value| value >= 2 })

# puts '---------------------------my_any'
# p(my_text.my_any?(/t/))
# p(my_array.my_any?(Numeric))
# p(my_array.my_any?)
# p(my_array.my_any? { |value| value > 10 })
# p(my_text.my_any?(/t/) { |value| value >= 2 })

# puts '---------------------------my_none?'
# p(%w[ant bear cat].my_none? { |word| word.length == 5 })
# p(%w[ant bear cat].my_none? { |word| word.length >= 4 })
# p(%w[ant bear cat].my_none?(/d/))
# p([1, 3.14, 42].my_none?(Float))
# p([].my_none?)
# p([nil].my_none?)
# p([nil, false].my_none?)
# p([nil, false, true].my_none?)
# p(%w[ant bear cat].none?(/d/) { |word| word.length >= 4 })

# puts '---------------------------my_count'
# p(my_array.my_count)
# p(my_array.my_count(2))
# p(my_array.my_count { |x| (x % 2).zero? })
# p(my_array.my_count(2) { |value| value })
# p((1..10).my_count { |x| (x % 2).zero? })

# puts '---------------------------my_map'
# p(my_array.my_map { |value| value * 2 })
# p((1..4).my_map { |i| i * i })
# p(my_array.my_map(&arg) { |value| value * 2 })

# puts '---------------------------my_inject'
# p(my_array.my_inject { |value| value * 2 })
# p((5..10).my_inject { |sum, n| sum + n })
# p((5..10).my_inject(1, :*))
# p((5..10).my_inject(1) { |product, n| product * n })
# longest = %w[cat mouse sheep bear banana].my_inject do |memo, word|
#   memo.length > word.length ? memo : word
# end
# p longest

# p my_array

# puts '---------------------------multiply_els'

# p(my_array.multiply_els)
