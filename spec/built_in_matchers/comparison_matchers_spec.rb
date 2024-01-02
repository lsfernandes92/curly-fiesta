describe 'Using comparison matchers' do
  # Numeric operators matchers
  describe 18 do
    it { is_expected.to be < 20 }
    it { is_expected.to be > 15 }
    it { is_expected.to be <= 19 }
    it { is_expected.to be >= 17 }
  
    it { is_expected.not_to be < 15 }
    it { is_expected.not_to be > 20 }
    it { is_expected.not_to be <= 17 }
    it { is_expected.not_to be >= 19 }

    it { is_expected.to be_between(1, 18).inclusive }
    it { is_expected.not_to be_between(1, 18).exclusive }
  end

  # String operators matchers
  describe 'a string' do
    it { is_expected.to start_with('a str') }
    it { is_expected.to end_with('ing') }
    it { is_expected.to a_string_matching(/str/) }
  end
end