# Test doubles are strict by default, raising errors when they receive messages
# that have not been allowed or expected. You can chain as_null_object off of
# double in order to make the double “loose”. For any message that has not
# explicitly allowed or expected, the double will return itself. It acts as a
# black hole null object, allowing arbitrarily deep method chains.

# as_null_object allows arbitrarily deep message chains and returns itself
describe 'as_null_object' do
  it 'returns itself' do
    dbl = double('Some Collaborator').as_null_object
    expect(dbl.foo.bar).to be(dbl)
  end
end

# Individual methods can still be allowed or expected
describe 'as_null_object' do
  it 'can allow individual methods' do
    dbl = double('Some Collaborator', :foo => 3).as_null_object
    allow(dbl).to receive(:bar).and_return(4)

    expect(dbl.foo).to eq(3)
    expect(dbl.bar).to eq(4)
  end
end