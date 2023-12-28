describe 'Using matchers' do
  # Paraphrasing the RSpec site...
  # rspec-rails offers a number of custom
  # matchers, most of which are rspec-compatible
  # wrappers for Rails’ assertions.
  # Here is one example using the 'eq' matcher:
  context '#sum' do
    it 'returns the sum of two numbers' do
      result = subject.sum(1, 2)

      expect(result).to eq(3)
    end
  end

  # Other matchers can be found here:
  # https://rspec.info/features/6-0/rspec-rails/matchers/
  # Or here:
  # https://rspec.info/features/3-12/rspec-expectations/
end