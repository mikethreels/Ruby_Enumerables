require_relative '../enumerals.rb'

describe Enumerable do
  let(:arr_num) { [1, 2, 3, 4, 5] }
  let(:arr_string) { %w[ant bear cat] }
  let(:has_num) { { a: 1, b: 2 } }
  let(:ran) { (1..5) }

  describe '#my_each' do
    context 'when the method is called using a block' do
      it 'runs block for each element in the variable, passing it as an argument and returning an array' do
        expect(arr_num.my_each { |i| arr_num[i - 1] }).to eql(arr_num.each { |i| arr_num[i - 1] })
      end

      it 'runs block for each element in the hash, passing it as an argument and returning an hash' do
        expect(has_num.my_each { |i| p i }).to eql(has_num.each { |i| p i })
      end

      it 'runs block for each element in the range, passing it as an argument and returning an range' do
        expect(ran.my_each { |i| p i }).to eql(ran.each { |i| p i })
      end
    end

    it 'When called without a block, it should return the Enumerator' do
      expect(arr_num.my_each).to be_an Enumerator
    end
  end

  describe '#my_each_with_index' do
    context 'when the method is called using a block' do
      it 'runs a block a code for an array and returns an element and index' do
        expect(arr_num.my_each_with_index { |e, i| e + i }).to eql(arr_num.each_with_index { |e, i| e + i })
      end

      it 'runs a block a code for an hash and returns an element and index' do
        expect(has_num.my_each_with_index { |e, i| e.to_s + i.to_s }).to eql(has_num.each_with_index { |e, i| e.to_s + i.to_s })
      end

      it 'runs a block a code for a range and returns an element and index' do
        expect(ran.my_each_with_index { |e, i| e + i }).to eql(ran.each_with_index { |e, i| e + i })
      end
    end

    it 'when no block given it returns an enumerator' do
      expect(arr_num.my_each_with_index).to be_an Enumerator
    end
  end

  describe '#my_select' do
    context 'when the method is called using a block' do
      it 'returns an array with the elements which pass the condition' do
        expect(arr_num.my_select { |value| value > 3 }).to eql(arr_num.select { |value| value > 3 })
      end

      it 'returns an array with the elements which pass the condition' do
        expect(ran.my_select { |value| value > 3 }).to eql(ran.select { |value| value > 3 })
      end
    end

    it 'when no block given it returns an enumerator' do
      expect(arr_num.my_select).to be_an Enumerator
    end
  end

  describe '#my_all' do
    context 'when the method is called using an argument' do
      it 'returns a true value if all elements pass the condition (strings)' do
        expect(arr_string.my_all?(/t/)).to eql(false)
      end

      it 'returns a true value if all elements pass the condition (numbers)' do
        expect(arr_num.my_all?(Numeric)).to eql(true)
      end
    end

    context 'when a block is given' do
      it 'the method returns a true value if all elements pass the condition (numbers)' do
        expect(arr_num.my_all? { |value| value >= 2 }).to eql(false)
      end

      it 'when an arg is also given returns a true value if all elements pass the condition from the arg (string)' do
        expect(arr_string.my_all?(/t/) { |value| value >= 2 }).to eql(false)
      end
    end

    it 'when no block is given ruby adds implicit block: { |e| e }' do
      expect(arr_string.my_all?).to eql(true)
    end
  end

  describe '#my_any?' do
    context 'when an argument is given' do
      it 'returns true if any value passes the condition otherwise returns false (strings)' do
        expect(arr_string.my_any?(/t/)).to eql(true)
      end

      it 'returns a true value if all elements pass the condition (numbers)' do
        expect(arr_num.my_any?(Numeric)).to eql(true)
      end
    end

    context 'when a block is given' do
      it 'the method returns true when any value passes the condition ortherwise returns false (numbers)' do
        expect(arr_num.my_any? { |value| value == 10 }).to eql(false)
      end

      it 'if an argument is also given the method return true if any value passes the condition in the argument (strings)' do
        expect(arr_string.my_any?(/t/) { |value| value >= 2 }).to eql(true)
      end
    end

    it 'when no block is given ruby adds implicit block: { |e| e }' do
      expect(arr_string.my_any?).to eql(true)
    end
  end

  describe '#my_none?' do
    context 'when the method is called using an argument' do
      it 'returns a true value if none of the elements pass the condition (strings)' do
        expect(arr_string.my_none?(/t/)).to eql(false)
      end

      it 'returns a true value if none of the elements pass the condition (numbers)' do
        expect(arr_num.my_none?(Numeric)).to eql(false)
      end
    end

    context 'when a block is given' do
      it 'the method returns a true value if none of the elements pass the condition (numbers)' do
        expect(arr_num.my_none? { |value| value >= 2 }).to eql(false)
      end

      it 'when an arg is also given returns a true value if none of the elements pass the condition from the arg (string)' do
        expect(arr_string.my_none?(/z/) { |value| value >= 2 }).to eql(true)
      end
    end

    it 'when no block is given returns true if none of the colection members is true' do
      expect(arr_string.my_none?).to eql(true)
    end
  end

  describe '#my_count' do
    context 'when a block is given' do
      it 'returns an int with the number of elements which pass the condition (numbers)' do
        expect(arr_num.my_count { |x| (x % 2).zero? }).to eql(arr_num.count { |x| (x % 2).zero? })
      end

      it 'returns an int with the number of elements which pass the condition (range)' do
        expect(ran.my_count { |x| (x % 2).zero? }).to eql(ran.count { |x| (x % 2).zero? })
      end

      it 'if argument is also given returns an int with the number of elements which are equal to the argument(numbers)' do
        expect(arr_num.my_count(2) { |value| value }).to eql(arr_num.count(2) { |value| value })
      end
    end

    it 'if only an argument is given returns an int with the number of elements which are equal to the argument(numbers)' do
      expect(arr_num.my_count(2)).to eql(arr_num.count(2))
    end

    it 'when no block is given returns the size of the array' do
      expect(arr_string.my_count).to eql(arr_string.count)
    end
  end
end
