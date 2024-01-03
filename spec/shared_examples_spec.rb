require "set"

# Shared examples group included in two groups in one file
shared_examples "a collection" do
  let(:collection) { described_class.new([7, 2, 4]) }

  context "initialized with 3 items" do
    it "says it has three items" do
      expect(collection.size).to eq(3)
    end
  end

  describe "#include?" do
    context "with an item that is in the collection" do
      it "returns true" do
        expect(collection.include?(7)).to be(true)
      end
    end

    context "with an item that is not in the collection" do
      it "returns false" do
        expect(collection.include?(9)).to be(false)
      end
    end
  end
end

describe Array do
  it_behaves_like "a collection"
end

describe Set do
  it_behaves_like "a collection"
end

# Providing context to a shared group using a block
shared_examples "a collection object" do
  describe "<<" do
    it "adds objects to the end of the collection" do
      collection << 1
      collection << 2
      expect(collection.to_a).to match_array([1, 2])
    end
  end
end

describe Array do
  it_behaves_like "a collection object" do
    let(:collection) { Array.new }
  end
end

describe Set do
  it_behaves_like "a collection object" do
    let(:collection) { Set.new }
  end
end

# Passing parameters to a shared example group
shared_examples "a measurable object" do |measurement, measurement_methods|
  measurement_methods.each do |measurement_method|
    it "should return #{measurement} from ##{measurement_method}" do
      expect(subject.send(measurement_method)).to eq(measurement)
    end
  end
end

describe Array, "with 3 items" do
  subject { [1, 2, 3] }
  it_should_behave_like "a measurable object", 3, [:size, :length]
end

describe String, "of 6 characters" do
  subject { "FooBar" }
  it_should_behave_like "a measurable object", 6, [:size, :length]
end
