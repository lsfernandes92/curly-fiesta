describe 'Using collection operator matchers' do
  describe [1, 2, 3] do
    it { is_expected.to include(1) }
    it { is_expected.not_to include(4) }
    it { is_expected.to match([1, 2, 3]) }
    it { is_expected.to contain_exactly(1, 2, 3) }
  end
end