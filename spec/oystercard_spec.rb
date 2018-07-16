require 'oystercard'

describe Oystercard do
  # check that card responds to balance method
  it 'responds to balance' do
    expect(subject).to respond_to(:balance)
  end
  # check that balance is an integer
  it 'checks that balance is an integer' do
    expect(subject.balance).to be_a Integer 
  end
end
