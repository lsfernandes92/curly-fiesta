# class_double is provided as a complement to instance_double with the
# difference that it verifies class methods on the given class rather than
# instance methods.

class User
  def suspend!
    ConsoleNotifier.notify('suspended as')
  end
end

class ConsoleNotifier
  MAX_WIDTH = 80

  def self.notify(message)
    puts message
  end
end

describe User, '#suspend!' do
  it 'notifies the console' do
    notifier = class_double('ConsoleNotifier').
      as_stubbed_const(:transfer_nested_constants => true)

    expect(notifier).to receive(:notify).with('suspended as')
    expect(ConsoleNotifier::MAX_WIDTH).to eq(80)

    user = User.new
    user.suspend!
  end
end
