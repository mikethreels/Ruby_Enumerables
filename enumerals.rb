module Enumerable

  def my_each
    return to_enum(__method__) unless block_given?

    size.times do |i|
      yield(to_a[i])
    end
    self
  end

  def my_each_with_index
    return to_enum(__method__) unless block_given?

    size.times do |i|
      yield(to_a[i], i)

    end
    self
  end

  def my_select
    return to_enum(__method__) unless block_given?

    arr = []
    size.times do |i|
      arr << to_a[i] if yield(to_a[i])
    end
    arr
  end

  def my_all?(arg = nil)
    puts "#{__FILE__}:#{__LINE__}: warning: given block not used" if arg && block_given?
    if arg
      return check_arg(arg)
    elsif !block_given?
      size.times do |i|
        return false if to_a[i] == false || to_a[i].nil?
      end
      return true
    else
      my_each do |i|
        return false unless yield(i)
      end
      true
    end
  end

  def my_any?(arg = nil)
    puts "#{__FILE__}:#{__LINE__}: warning: given block not used" if arg && block_given?
    if arg
      return check_any_arg(arg)
    elsif !block_given?
      my_each do |i|
        return true if i
      end
      return false
    else
      my_each do |i|
        return true if yield(i)
      end
      false
    end
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

  def check_arg(arg)
    if arg.is_a? (Regexp)
      my_each do |i|
        return false if (i =~ arg).nil?
      end
      return true
    elsif arg 
      my_each do |i|
        return false if !(i.is_a? (arg))
      end
      return true
    end
  end

  def check_any_arg(arg)
    if arg.is_a? (Regexp)
      my_each do |i|
        return true if !(i =~ arg).nil?
      end
      return false
    elsif arg 
      my_each do |i|
        return true if (i.is_a? (arg))
      end
      return false
    end
  end

end
