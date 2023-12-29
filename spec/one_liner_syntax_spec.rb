describe 'Using the one liner syntax' do
  describe (1..5) do
    it 'covers the numbers 3 and 4' do
      expect(subject).to cover(3, 4)
    end

    # When the expectation is written as 'expect(subject)',
    # it can be simplified as the following and the 
    # scenario description will be implict named in the output
    it { is_expected.to cover(3, 4) }

    # This is another option that will 
    # implicitly name the scenario in the output
    it { expect(subject).to cover(3, 4) }
  end
end