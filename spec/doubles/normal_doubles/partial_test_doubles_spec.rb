# A partial test double is an extension of a real object in a system that is
# instrumented with test-double like behaviour in the context of a test.
# This technique is very common in Ruby because we often see class objects acting
# as global namespaces for methods.
# 
# RSpec replaces the method we’re stubbing or mocking with its own test-double
# like method. At the end of the example, RSpec verifies any message expectations,
# and then restores the original methods.

# Only the specified methods are redefined
describe 'A partial double' do
  # Note: stubbing a string like this is a terrible idea.
  # This is just for demonstration purposes.
  let(:string) { 'a string' }
  before { allow(string).to receive(:length).and_return(500) }

  it 'redefines the specified methods' do
    expect(string.length).to eq(500)
  end

  it 'does not effect other methods' do
    expect(string.reverse).to eq('gnirts a')
  end
end

# The original method is restored when the example completes
class User
  def self.find(id)
    :original_return_value
  end
end

describe 'A partial double' do
  it 'redefines a method' do
    allow(User).to receive(:find).and_return(:redefined)
    expect(User.find(3)).to eq(:redefined)
  end

  it 'restores the redefined method after the example completes' do
    expect(User.find(3)).to eq(:original_return_value)
  end
end