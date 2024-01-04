# When the verify_partial_doubles configuration option is set, the same argument
# and method existence checks that are performed for object_double are also
# performed on partial doubles. You should set this unless you have a good
# reason not to. It defaults to off only for backwards compatibility.

# Doubling an existing object
class User
  def save; false; end
end

def save_user(user)
  'saved!' if user.save
end

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

describe '#save_user' do
  it 'renders message on success' do
    user = User.new
    expect(user).to receive(:wave).and_return(true) # Typo in name
    expect(save_user(user)).to eq('saved!')
  end
end
