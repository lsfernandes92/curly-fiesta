describe 'Using Types/Classes/response operator matchers' do
  describe 'a string' do
    # Class/type operators matchers
    # The be_instance_of return true if
    # the object is an instance of that exact class
    # not a subclass
    it { is_expected.to be_instance_of(String) }
    # The be_kind_of is the exact opposite of that
    # because 'a string' is a String and String
    # is a subclass of Object
    it { is_expected.to be_kind_of(Object) }
    # The be_a/be_an works the same as the
    # be_kind_of
    it { is_expected.to be_an(Object) }
    it { is_expected.to respond_to(:[])}
    it { is_expected.to respond_to(:size)}
  end
end