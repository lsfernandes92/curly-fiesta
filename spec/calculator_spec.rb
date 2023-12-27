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
end