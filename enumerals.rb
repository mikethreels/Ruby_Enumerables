module Tools


  def my_each
    return to_enum(:my_each) unless block_given?
    arr = []
    self.length.times do|i| 
    yield (self[i])
    arr << self[i]
    end
    arr
  end

end

include Tools
my_array = [5, 4, 6, 7]
p my_array.my_each 
p my_array.each 


