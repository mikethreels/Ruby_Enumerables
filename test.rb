require_relative 'enumerals.rb'
include Tools
my_array = [nil, false, true]
# p my_array.my_each { |value| p value }
# p my_array.my_each_with_index { |value, i| p value, i }
# p my_array.my_select { |value| p value.odd? }
# p my_array.my_all? { |value| p value > 3 }
# p my_array.my_any? { |value| p value > 6}

p my_array.my_none? { |value| p value > 3 }
puts "hello world"
p my_array.none? { |value| p value > 3 }

