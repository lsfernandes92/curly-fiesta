require 'calculator'

describe Calculator do
  context '#sum' do
    it 'returns the sum of two numbers' do
      result = subject.sum(1, 2)

      expect(result).to eq(3)
    end

    context 'when has negative numbers' do
      it 'returns the sum of two numbers' do
        result = subject.sum(-1, 2)

        expect(result).to eq(1)
      end

      it 'returns the sum of two negative numbers' do
        result = subject.sum(-1, -2)

        expect(result).to eq(-3)
      end
    end
  end

  context '#div' do
    it 'returns the division of two numbers' do
      result = subject.div(4, 2)

      expect(result).to eq(2)
    end

    context 'when it is divided by 0' do
      it 'raises zero division error' do
        expect{ subject.div(1 / 0) }.to raise_error(ZeroDivisionError)
      end
    end

    context 'when the quantity exceeds the divisor' do
      it 'returns 0' do
        result = subject.div(1, 2)
  
        expect(result).to eq(0)
      end
    end

    context 'when has negative number' do
      it 'returns the negative value' do
        result = subject.div(-4, 2)
  
        expect(result).to eq(-2)
      end
    end
  end
end