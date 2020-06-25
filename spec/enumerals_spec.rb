require_relative '../enumerals.rb'

describe Enumerable do
  let(:arr_num) { Array(1..5) }

  describe "#my_each" do
    it "runs block for each element in the variable, passing it as an argument and returning an array" do
      expect(arr_num.my_each { |i| i }).to eql(arr_num.my_each { |i| i })
    end
  end
end