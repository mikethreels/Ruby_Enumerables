module Enumerable
  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

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
    size.times { |i| arr << to_a[i] if yield(to_a[i]) }
    arr
  end

  def my_all?(arg = nil)
    puts "#{__FILE__}:#{__LINE__}: warning: given block not used" if arg && block_given?
    check_arg(arg) if arg

    if !block_given?
      size.times { |i| return false if to_a[i] == false || to_a[i].nil? }
    else
      my_each { |i| return false unless yield(i) }
    end
    true
  end

  def my_any?(arg = nil)
    puts "#{__FILE__}:#{__LINE__}: warning: given block not used" if arg && block_given?
    check_any_arg(arg) if arg

    if !block_given?
      my_each { |i| return true if i }
    else
      my_each { |i| return true if yield(i) }
    end
    false
  end

  def my_none?(arg = nil)
    puts "#{__FILE__}:#{__LINE__}: warning: given block not used" if arg && block_given?
    return !check_any_arg(arg) if arg

    if !block_given?
      my_each { |i| return false if i == true }
    else
      my_each { |i| return false if yield(i) }
    end

    true
  end

  def my_count(arg = nil)
    puts "#{__FILE__}:#{__LINE__}: warning: given block not used" if arg && block_given?
    return size if !block_given? && arg.nil?

    counter = 0
    if arg
      my_each { |i| counter += 1 if i == arg }
    else
      my_each { |i| counter += 1 if yield(i) }
    end
    counter
  end

  def my_map(arg = nil)
    puts "#{__FILE__}:#{__LINE__}: warning: given block not used" if arg && block_given?
    new_arr = []

    return to_enum(:my_map) if !block_given? && arg.nil?

    my_each { |i| new_arr << arg.call(i) } unless arg.nil?

    my_each { |i| new_arr << yield(i) } if arg.nil? && block_given?

    new_arr
  end

  def my_inject(arg = nil, sym = nil)
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    raise LocalJumpError.new, 'no block given' unless block_given? || arg

    org_arr = self
    array = arg.nil? ? org_arr.to_a : org_arr.to_a.unshift(arg)
    return nil if array.empty?

    result = array[0]
    array.my_each { |i| result = yield(result, i) } if sym.nil? && !arg.nil? && block_given?

    array[1..-1].my_each { |i| result = yield(result, i) } if sym.nil? && arg.nil? && block_given?

    array.my_each { |i| result = result.method(sym).call(i) } unless sym.nil?
    result
  end

  def multiply_els
    my_inject { |i, a| i * a }
  end

  def check_arg(arg)
    if arg.is_a?(Regexp)
      my_each { |i| return false if (i =~ arg).nil? }
      true
    elsif arg
      my_each { |i| return false unless i.is_a? arg }
      true
    end
  end

  def check_any_arg(arg)
    if arg.is_a?(Regexp)
      my_each { |i| return true unless (i =~ arg).nil? }
      false
    elsif arg
      my_each { |i| return true if i.is_a? arg }
      false
    end
  end
end
