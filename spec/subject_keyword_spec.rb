describe 'Using subject keyword' do
  # The subject refers to the class being tested
  describe '#sum' do
    xit 'sums of two numbers' do
      result = subject.sum(1, 2)

      expect(result).to eq 3
    end
  end

  # The subject can also be rename as the following:
  subject(:calculator) { Calculator.new }

  describe '#sum' do
    xit 'sums two numbers' do
      result = calculator.sum(1, 2)

      expect(result).to eq 3
    end
  end

  # When the first described text is followed by
  # the same name class that is being under test
  # we can also use the described_class keyword
  # Like the following:
  subject(:calculator) { described_class.new }

  describe '#sum' do
    xit 'sums two numbers' do
      result = calculator.sum(1, 2)

      expect(result).to eq 3
    end
  end
end