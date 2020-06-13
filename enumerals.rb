module Enumerable
  def my_each
    if block_given? #If 'self' has block {||}
      size.times do |i| # Takes size of "self" (variable, array, hash, etc) that the method was invoqued. And loops (times) 'size' times. i = each number of loops
        yield(to_a[i]) # Executes the block everytime it's called and place inside of an array every value of i.
      end
    end

    block_given? ? self : enum_for(__method__) # Return command. If block was given return "self" (variable, array, etc). Else, return Enumerator method name (in this case "my_each")

  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    org_arr = self
    arr = []
    org_arr.length.times do |i|
      yield(org_arr[i], i)
      arr << org_arr[i]
    end
    arr
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    org_arr = self
    arr = []
    org_arr.length.times do |i|
      arr << org_arr[i] if yield(org_arr[i])
    end
    arr
  end

  def my_all?
    return true unless block_given?

    org_arr = self
    org_arr.length.times do |i|
      return false unless yield(org_arr[i])
    end
    org_arr = true
  end

  def my_any?
    return true unless block_given?

    org_arr = self
    org_arr.length.times do |i|
      return true if yield(org_arr[i])
    end
    org_arr = false
  end

  def my_none?
    org_arr = self
    result = true
    if block_given?
      org_arr.my_each { |i| return false if yield(i) }
    else
      org_arr.my_each { |i| result = false if i == true || (i.is_a? Integer) }
      return result
    end
    true
  end

  def my_count
    org_arr = self
    return org_arr.length unless block_given?

    counter = 0
    org_arr.my_each { |i| counter += 1 if yield(i) }
    counter
  end

  def my_map(arg = nil)
    org_arr = self
    new_arr = []

    return to_enum(:my_map) if !block_given? && arg.nil?

    org_arr.my_each { |i| new_arr << arg.call(i) } unless arg.nil?

    org_arr.my_each { |i| new_arr << yield(i) } if arg.nil? && block_given?

    new_arr
  end

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  def my_inject(arg = nil, sym = nil)
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

    org_arr = self
    array = arg.nil? ? org_arr : org_arr.unshift(arg)
    return nil if array.empty?

    result = array[0]
    array.my_each { |i| result = yield(result, i) } if sym.nil? && !arg.nil? && block_given?

    array[1..-1].my_each { |i| result = yield(result, i) } if sym.nil? && arg.nil? && block_given?

    array.my_each { |i| result = result.method(sym).call(i) } unless sym.nil?
    result
  end

  def multiply_els
    array = self
    array.my_inject { |i, a| i * a }
  end
end
