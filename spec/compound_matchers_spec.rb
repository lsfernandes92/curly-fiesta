describe 'Using compound matchers' do
  describe 'foo string' do
    it { expect(subject).to start_with('foo').and end_with('string') }
    it { expect(sample_fruit).to eq('banana').or eq('grape').or eq('orange') }
  end
end