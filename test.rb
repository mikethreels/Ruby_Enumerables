require_relative 'enumerals.rb'
include Tools
my_array = [5, 4, 6, 7]
# p my_array.my_each { |value| p value }
# p my_array.my_each_with_index { |value, i| p value, i }

p my_array.my_select { |value| p value.odd? }