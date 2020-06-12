require_relative 'enumerals.rb'
include Tools
my_array = [5, 4, 3, 2, 1]
my_text = %w[sheep cat bear]
my_empty = []
my_letter = %w[a b c]
# p my_array.my_each { |value| p value }
# p my_array.my_each_with_index { |value, i| p value, i }
# p my_array.my_select { |value| p value.odd? }
# p my_array.my_all? { |value| p value > 3 }
# p my_array.my_any? { |value| p value > 6}
# p my_array.my_none? { |value| p value > 6 }
# p my_array.my_count { |value| p value > 3 }
# arg = Proc.new {|x| x**2 }
# p my_array.my_map{ |value| p value * 2 }
# p my_array.my_inject { |value| p value * 2 }
# p my_array.multiply_els

puts '--my_each: ----------------------'

puts ''


my_array.my_each { |x| print "#{x} -- " } 



puts "\n\n\n"



puts '--my_each_with_index: -----------'

puts ''


my_letter.my_each_with_index { |x, i| print "[#{x}, #{i}] -- " } 



puts "\n\n\n"



puts '--my_select: --------------------'

puts ''

p my_array.my_select { |v| v > 3 }



puts "\n\n\n"



puts '--my_all?: ----------------------'

puts ''



p my_text.my_all? { |word| word.length >= 3 } 

p my_text.my_all? { |word| word.length >= 5 }



puts "\n\n\n"



puts '--my_any?: ----------------------'

puts ''



p my_text.any? { |word| word.length >= 3 }

p my_text.any? { |word| word.length >= 4 } #=> true

p my_text.any?(/d/) #=> false



puts "\n\n\n"



puts '--my_none?: ----------------------'

puts ''



p my_text.my_none? { |word| word.length == 5 }

p my_text.my_none? { |word| word.length >= 4 }

p my_text.my_none?(/t/)

p [1, 3.14, 42].my_none?(Float) #=> false



puts "\n\n\n"



puts '--my_count: ----------------------'

puts ''



ary = [1, 2, 4, 2]

p ary.my_count #=> 4

p ary.my_count 2 #=> 2

p(ary.my_count { |x| (x % 2).zero? }) #=> 3



puts "\n\n\n"



puts '--my_map: ------------------------'

puts ''



p 1..4.my_map { |i| i * i } #=> [1, 4, 9, 16]



puts "\n\n\n"



puts '--my_inject: ---------------------'

puts ''



p 5..10.my_inject(:+) #=> 45

p 5..10.my_inject { |sum, n| sum + n } #=> 45

p 5..10.my_inject(1, :*) #=> 151200

p 5..10.my_inject(1) { |product, n| product * n } #=> 151200

l = %w[cat sheep bear].my_inject do |memo, word|

  memo.length > word.length ? memo : word

end

p l #=> "sheep"