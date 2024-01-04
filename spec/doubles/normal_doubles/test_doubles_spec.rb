# Test double is a generic term for any object that stands in for a real object
# during a test (think “stunt double”). You create one using the double method.
# Doubles are “strict” by default – any message you have not allowed or expected
# will trigger an error – but you can switch a double to being “loose”. When
# creating a double, you can allow messages (and set their return values) by
# passing a hash.
# 
# Once you have a test double, you can allow or expect messages on it.
# 
# It's recommended to use verifying doubles whenever possible.
# Test doubles link reference: https://rspec.info/features/3-12/rspec-mocks/basics/test-doubles/

# Doubles are strict by default (deliberated failure)
describe 'A test double' do
  it 'raises errors when messages not allowed or expected are received' do
    dbl = double('Some Collaborator')
    dbl.foo
  end
end

# A hash can be used to define allowed messages and return values
describe 'A test double' do
  it 'returns canned responses from the methods named in the provided hash' do
    dbl = double('Some Collaborator', foo: 3, bar: 4)
    expect(dbl.foo).to eq(3)
    expect(dbl.bar).to eq(4)
  end
end

# Allowed messages return nil by default
describe 'allow' do
  it 'returns nil from allowed messages' do
    dbl = double('Some Collaborator')
    allow(dbl).to receive(:foo)
    expect(dbl.foo).to be_nil
  end
end

# Messages can be allowed in bulk using receive_messages
describe 'receive_messages' do
  it 'configures return values for the provided messages' do
    dbl = double('Some Collaborator')
    allow(dbl).to receive_messages(foo: 2, bar: 3)
    expect(dbl.foo).to eq(2)
    expect(dbl.bar).to eq(3)
  end
end

# Failing positive message expectation (deliberated failure)
describe 'An unfulfilled positive message expectation' do
  it 'triggers a failure' do
    dbl = double('Some Collaborator')
    expect(dbl).to receive(:foo)
  end
end

# Passing positive message expectation
describe 'A fulfilled positive message expectation' do
  it 'passes' do
    dbl = double('Some Collaborator')
    expect(dbl).to receive(:foo)
    dbl.foo
  end
end

# Failing negative message expectation (deliberated failure)
describe 'A negative message expectation' do
  it 'fails when the message is received' do
    dbl = double('Some Collaborator').as_null_object
    expect(dbl).not_to receive(:foo)
    dbl.foo
  end
end

# Passing negative message expectation
describe 'A negative message expectation' do
  it 'passes if the message is never received' do
    dbl = double('Some Collaborator').as_null_object
    expect(dbl).not_to receive(:foo)
  end
end