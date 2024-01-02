require 'calculator'

describe Calculator do
  describe 'Using expecting errors matchers' do
    it 'raises exception' do
      expect{ subject.div(1 / 0) }.to raise_exception
    end

    it 'raises zero division error' do
      expect{ subject.div(1 / 0) }.to raise_error(ZeroDivisionError)
      expect{ subject.div(1 / 0) }.to raise_error('divided by 0')
      expect{ subject.div(1 / 0) }.to raise_error(ZeroDivisionError, 'divided by 0')
      expect{ subject.div(1 / 0) }.to raise_error(/divided/)
    end
  end
end