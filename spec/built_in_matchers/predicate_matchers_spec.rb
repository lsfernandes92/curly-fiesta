describe 'Using predicate methods' do
  describe 2 do
    it { is_expected.to be_even }
    it { is_expected.not_to be_odd }
  end

  describe [1, 2, 3] do
    it { is_expected.not_to be_empty }
    it { is_expected.not_to be_nil }
  end

  describe 'Hash predicate methods' do
    let(:foo_hash) { {
      foo: 'foo',
      name: 'name'
    } }

    it { expect(foo_hash).to have_key(:foo) }
  end
end