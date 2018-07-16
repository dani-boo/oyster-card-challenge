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
end
