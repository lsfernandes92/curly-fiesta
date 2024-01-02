describe 'Using satisfy matcher' do
  describe 10 do
    it { is_expected.to satisfy { |v| v > 5 } }
    it { is_expected.not_to satisfy { |v| v > 15 } }
    it { is_expected.to satisfy("be greater than 5") { |v| v > 5 } }
    it { is_expected.not_to satisfy("be greater than 15") { |v| v > 15 } }
  end
end