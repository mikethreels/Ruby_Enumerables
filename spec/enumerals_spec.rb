require_relative '../enumerals.rb'

describe Enumerable do
  let(:arr_num) { [1, 2, 3, 4, 5] }
  let(:arr_string) { %w[ant bear cat] }
  let(:has_num) { { a: 1, b: 2 } }
  let(:ran) { (1..5) } 

  describe "#my_each" do

    it "runs block for each element in the variable, passing it as an argument and returning an array" do
      expect(arr_num.my_each { |i| i }).to eql(arr_num.each { |i| i })
    end

    it "runs block for each element in the hash, passing it as an argument and returning an hash" do
      expect(has_num.my_each { |i| i }).to eql(has_num.each { |i| i })
    end

    it "runs block for each element in the range, passing it as an argument and returning an range" do
      expect(ran.my_each { |i| i }).to eql(ran.each { |i| i })
    end

    it "When called without a block, it should return the Enumerator" do
      expect(arr_num.my_each).to be_an Enumerator
    end

  end
end