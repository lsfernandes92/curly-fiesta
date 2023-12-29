describe 'Using comparison matchers' do
  # Numeric operators matchers
  describe 18 do
    it { is_expected.to be < 20 }
    it { is_expected.to be > 15 }
    it { is_expected.to be <= 19 }
    it { is_expected.to be >= 17 }
  
    # deliberate failures
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
    it { is_expected.to match(/str/) }

    # Class/type operators matchers
    # The be_instance_of return true if
    # the object is an instance of that exact class
    # not a subclass
    it { is_expected.to be_instance_of(String) }
    # The be_kind_of is the exact opposite of that
    # because 'a string' is a String and String
    # is a subclass of Object
    it { is_expected.to be_kind_of(Object) }
    # The be_a/be_an works the same as the
    # be_kind_of
    it { is_expected.to be_an(Object) }
  end

  describe [1, 2, 3] do
    # Predicate operators matchers
    it { is_expected.not_to be_empty }

    # Collection operators matchers
    it { is_expected.to include(1) }
    it { is_expected.not_to include(4) }
    it { is_expected.to match([1, 2, 3]) }
    it { is_expected.to contain_exactly(1, 2, 3) }
  end

  it 'change observation matcher' do
    a = 0
    expect { a += 1 }.to change { a }.by(1)
    expect { a += 3 }.to change { a }.from(1).to(4)
    expect { a += 3 }.to change { a }.by_at_least(2)
  end
end