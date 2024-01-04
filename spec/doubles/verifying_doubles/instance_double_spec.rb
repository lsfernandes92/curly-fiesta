# Verifying doubles are a stricter alternative to normal doubles that provide
# guarantees about what is being verified. When using verifying doubles, RSpec
# will check that the methods being stubbed are actually present on the
# underlying object if it is available. Prefer using verifying doubles
# over normal doubles.
# 
# No checking will happen if the underlying object or class is not defined, but
# when run with it present (either as a full spec run or by explicitly
# preloading collaborators) a failure will be triggered if an invalid method
# is being stubbed or a method is called with an invalid number of arguments.
# 
# This dual approach allows you to move very quickly and test components in
# isolation, while giving you confidence that your doubles are not a complete
# fiction. Testing in isolation is optional but recommended for classes that do
# not depend on third-party components.
# 
# An `instance_double` is the most common type of verifying double. It takes a
# class name or object as its first argument, then verifies that any methods
# being stubbed would be present on an instance of that class. In addition, when
# it receives messages, it verifies that the provided arguments are supported by
# the method signature, both in terms of arity and allowed or required keyword
# arguments, if any. The same argument verification happens when you constrain
# the arguments using with.
# 
# Link reference: https://rspec.info/features/3-12/rspec-mocks/verifying-doubles/
class User < Struct.new(:notifier)
  def suspend!
    notifier.notify("suspended as")
  end
end

class ConsoleNotifier
  def notify(msg)
    puts message
  end
end

describe User, '#suspend!' do
  context 'passes when method implemented' do
    it 'notifies the console' do
      notifier = instance_double("ConsoleNotifier")
  
      expect(notifier).to receive(:notify).with("suspended as")
  
      user = User.new(notifier)
      user.suspend!
    end
  end
end
