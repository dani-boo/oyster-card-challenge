require 'oystercard'

describe Oystercard do
  # card responds to balance method
  it 'responds to balance' do
    expect(subject).to respond_to(:balance)
  end
  # balance is an integer
  it 'checks that balance is an integer' do
    expect(subject.balance).to be_a Integer
  end
  # card responds to top_up method
  it 'responds to top_up with 1 argument' do
    expect(subject).to respond_to(:top_up).with(1).argument
  end
  # card can be topped up
  it 'adds top-up amount to balance' do
    expect(subject.top_up(20)).to eq 20
  end
  # card doesn't exceed max limit
  it 'raises error when balance exceeds max_limit' do
    max_balance = Oystercard::MAX_LIMIT
    subject.top_up(max_balance)
    expect { subject.top_up 1 }.to raise_error 'Maximum balance exceeded'
  end
end
