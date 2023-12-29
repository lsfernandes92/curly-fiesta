describe 'Using predicate methods' do
  describe 2 do
    it { is_expected.to be_even }
    it { is_expected.not_to be_odd }
  end

  describe [1, 2, 3] do
    it { is_expected.not_to be_empty }
    it { is_expected.not_to be_nil }
  end
end