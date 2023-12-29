describe 'Using matchers' do
  # There are several related 'be' matchers
  # Some are listed in this file and other can be found here:
  # https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/be/

  # The be_truthy matcher passes if obj is truthy (not nil or false)
  context 'be_truthy matcher' do
    it { expect(true).to be_truthy }
    it { expect(7).to be_truthy }
    it { expect('foo').to be_truthy }
    it { expect(nil).not_to be_truthy }
    it { expect(false).not_to be_truthy }
  
    # deliberate failures
    it { expect(true).not_to be_truthy }
    it { expect(7).not_to be_truthy }
    it { expect('foo').not_to be_truthy }
    it { expect(nil).to be_truthy }
    it { expect(false).to be_truthy }
  end

  # The be_falsey matcher passes if obj is falsy (nil or false)
  context 'be_falsey matcher' do
    it { expect(nil).to be_falsey }
    it { expect(false).to be_falsey }
    it { expect(true).not_to be_falsey }
    it { expect(7).not_to be_falsey }
    it { expect("foo").not_to be_falsey }
  
    # deliberate failures
    it { expect(nil).not_to be_falsey }
    it { expect(false).not_to be_falsey }
    it { expect(true).to be_falsey }
    it { expect(7).to be_falsey }
    it { expect("foo").to be_falsey }
  end

  # The be_nil matcher passes if obj is nil
  context 'be_nil matcher' do
    it { expect(nil).to be_nil }
    it { expect(false).not_to be_nil }
    it { expect(true).not_to be_nil }
    it { expect(7).not_to be_nil }
    it { expect("foo").not_to be_nil }
  
    # deliberate failures
    it { expect(nil).not_to be_nil }
    it { expect(false).to be_nil }
    it { expect(true).to be_nil }
    it { expect(7).to be_nil }
    it { expect("foo").to be_nil }  
  end

  # The be matcher passes if obj is truthy (not nil or false)
  context 'be matcher' do
    it { expect(true).to be }
    it { expect(7).to be }
    it { expect("foo").to be }
    it { expect(nil).not_to be }
    it { expect(false).not_to be }
  
    # deliberate failures
    it { expect(true).not_to be }
    it { expect(7).not_to be }
    it { expect("foo").not_to be }
    it { expect(nil).to be }
    it { expect(false).to be }
  end
end