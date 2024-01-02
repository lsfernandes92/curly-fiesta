describe 'Using equality matchers' do
  # rspec-expectations ships the following
  # equality matchers:
  context 'Compare using eq (==)' do
    context 'a string' do
      it 'is equal to another string of the same value' do
        expect('this string').to eq('this string')
      end
    
      it 'is not equal to another string of a different value' do
        expect('this string').not_to eq('a different string')
      end
    end
    
    context 'an integer' do
      it 'is equal to a float of the same value' do
        expect(5).to eq(5.0)
      end
    end
  end

  context 'Compare using ==' do
    context 'a string' do
      it 'is equal to another string of the same value' do
        expect('this string').to be == 'this string'
      end
    
      it 'is not equal to another string of a different value' do
        expect('this string').not_to be == 'a different string'
      end
    end
    
    context 'an integer' do
      it 'is equal to a float of the same value' do
        expect(5).to be == 5.0
      end
    end
  end

  context 'Compare using eql (eql?)' do
    context "an integer" do
      it "is equal to another integer of the same value" do
        expect(5).to eql(5)
      end
    
      it "is not equal to another integer of a different value" do
        expect(5).not_to eql(6)
      end
    
      it "is not equal to a float of the same value" do
        expect(5).not_to eql(5.0)
      end
    end    
  end

  context 'Compare using equal (equal?)' do
    context "a string" do
      it "is equal to itself" do
        string = "this string"
        expect(string).to equal(string)
      end
    
      it "is not equal to another string of the same value" do
        expect("this string").not_to equal("this string")
      end
    
      it "is not equal to another string of a different value" do
        expect("this string").not_to equal("a different string")
      end
    
    end    
  end

  context 'Compare using be (equal?)' do
    context "a string" do
      it "is equal to itself" do
        string = "this string"
        expect(string).to be(string)
      end
    
      it "is not equal to another string of the same value" do
        expect("this string").not_to be("this string")
      end
    
      it "is not equal to another string of a different value" do
        expect("this string").not_to be("a different string")
      end
    end    
  end
end