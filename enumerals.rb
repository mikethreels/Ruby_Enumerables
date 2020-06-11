module Tools


  def my_each
    return to_enum(:my_each) unless block_given?
    arr = []
    self.length.times do|i| 
    yield(self[i])
    arr << self[i]
    end
    arr
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    arr = []
    self.length.times do |i|
      yield(self[i], i)
      arr << self[i]
    end
  arr
  end
end
