describe 'Using hooks on RSpec' do
  # Use before and after hooks to execute arbitrary code before and/or after the
  # body of an example is run:
  # 
  # before(:example) # run before each example
  # before(:context) # run one time only, before all of the examples in a group
  # 
  # after(:example) # run after each example
  # after(:context) # run one time only, after all of the examples in a group
  # before and after blocks are called in the following order:
  # before :suite
  # before :context
  # before :example
  # after  :example
  # after  :context
  # after  :suite
  # 
  # A bare before or after hook defaults to the :example scope.
  # 
  # before and after hooks can be defined directly in the example groups they
  # should run in, or in a global RSpec.configure block. Note that the status of
  # the example does not affect the hooks.
  # 
  # WARNING: Setting instance variables are not supported in before(:suite).
  # WARNING: Mocks are only supported in before(:example).
  # WARNING: around hooks will execute before any before hooks, and after any
  # after hooks regardless of the context they were defined in.
  class Thing
    def widgets
      @widgets ||= []
    end
  end
  
  describe Thing do
    before(:example) do
      @thing = Thing.new
    end
  
    describe 'initialized in before(:example)' do
      it 'has 0 widgets' do
        expect(@thing.widgets.count).to eq(0)
      end
  
      it 'can accept new widgets' do
        @thing.widgets << Object.new
      end
  
      it 'does not share state across examples' do
        expect(@thing.widgets.count).to eq(0)
      end
    end
  end

  describe Thing do
    before(:context) do
      @thing = Thing.new
    end
  
    describe 'initialized in before(:context)' do
      it 'has 0 widgets' do
        expect(@thing.widgets.count).to eq(0)
      end
  
      it 'can accept new widgets' do
        @thing.widgets << Object.new
      end
  
      it 'shares state across examples' do
        expect(@thing.widgets.count).to eq(1)
      end
    end
  end  
end