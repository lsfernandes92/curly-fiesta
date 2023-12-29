describe 'Using change observation matchers' do
  
  it 'matches the value changes' do
    foo_number = 0
    expect { foo_number += 1 }.to change { foo_number }.by(1)
    expect { foo_number += 3 }.to change { foo_number }.from(1).to(4)
    expect { foo_number += 3 }.to change { foo_number }.by_at_least(2)
  end
end