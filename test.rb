require_relative 'enumerals.rb'
include Tools
my_array = [2, 3, 4, 5]
# p my_array.my_each { |value| p value }
# p my_array.my_each_with_index { |value, i| p value, i }
# p my_array.my_select { |value| p value.odd? }
# p my_array.my_all? { |value| p value > 3 }
# p my_array.my_any? { |value| p value > 6}
# p my_array.my_none? { |value| p value > 6 }
# p my_array.my_count { |value| p value > 3 }
# p my_array.my_map { |value| p value * 2 }


p my_array.my_inject(2, :+) 

p my_array.inject(2, :+) 
