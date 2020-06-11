# frozen_string_literal: true

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
end
