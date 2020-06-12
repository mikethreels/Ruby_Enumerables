# frozen_string_literal: true

# rubocop:disable Style/CaseEquality

# This module copies the Enumerable Module embedded with Ruby
module Tools
  def my_each
    return to_enum(:my_each) unless block_given?

    org_arr = self
    arr = []
    org_arr.length.times do |i|
      yield(org_arr[i])
      arr << org_arr[i]
    end
    arr
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

  def my_map
    return to_enum(:my_map) unless block_given?

    org_arr = self
    new_arr = []

    org_arr.my_each { |i| new_arr << yield(i) }
    new_arr
  end

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity

  def my_inject(arg = nil, sym = nil)
    org_arr = self
    array = arg.nil? ? org_arr : org_arr.unshift(arg)
    return nil if array.empty?

    result = array[0]
    array.my_each { |i| result = yield(result, i) } if sym.nil? && !arg.nil? && block_given?

    array[1..-1].my_each { |i| result = yield(result, i) } if sym.nil? && arg.nil? && block_given?

    array.my_each { |i| result = result.method(sym).call(i) } unless sym.nil?
    result
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
end
# rubocop:enable Style/CaseEquality
