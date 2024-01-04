# Message expectations put an example’s expectation at the start, before you’ve
# invoked the code-under-test. Many developers prefer using an arrange-act-assert
# (or given-when-then) pattern for structuring tests. Spies are an alternate type
# of test double that support this pattern by allowing you to expect that a
# message has been received after the fact, using have_received.
# 
# You can use any test double (or partial double) as a spy, but the double must
# be setup to spy on the messages you care about. Spies automatically spy on all
# messages, or you can allow a message to spy on it.

# Using a spy
describe 'have_received' do
  it 'passes when the message has been received' do
    invitation = spy('invitation')
    invitation.deliver
    expect(invitation).to have_received(:deliver)
  end
end

# Spy on a method on a partial double
class Invitation
  def self.deliver; end
end

describe 'have_received' do
  it 'passes when the expectation is met' do
    allow(Invitation).to receive(:deliver)
    Invitation.deliver
    expect(Invitation).to have_received(:deliver)
  end
end

# Failure when the message has not been received (deliberated failures)
class Invitation
  def self.deliver; end
end

describe 'failure when the message has not been received' do
  example 'for a spy' do
    invitation = spy('invitation')
    expect(invitation).to have_received(:deliver)
  end

  example 'for a partial double' do
    allow(Invitation).to receive(:deliver)
    expect(Invitation).to have_received(:deliver)
  end
end
