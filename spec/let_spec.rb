$count = 0

describe 'How to use let' do
  describe 'let' do
    let(:count) { $count += 1 }
  
    it 'memoizes the value' do
      expect(count).to eq(1)
      expect(count).to eq(1)
    end
  
    it 'is not cached across examples' do
      expect(count).to eq(2)
    end
  end
end