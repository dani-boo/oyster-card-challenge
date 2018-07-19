require 'oystercard'

describe Oystercard do
  let(:entry_station){ double :test_entry_station }
  let(:exit_station){ double :test_exit_station }  

  context 'money on card' do
    describe '#balance' do
      
      it 'responds to balance' do # card responds to balance method
        expect(subject).to respond_to(:balance)
      end
      
      it 'has a balance of zero' do # card has balance of zero
        expect(subject.balance).to eq(0)
      end
     
      it 'checks that balance is an integer' do  # balance is an integer
        expect(subject.balance).to be_a Integer
      end
    end

    describe '#top_up' do
      
      it 'responds to top_up with 1 argument' do # card responds to top_up method
        expect(subject).to respond_to(:top_up).with(1).argument
      end
      
      it 'adds top-up amount to balance' do # card can be topped up
        expect(subject.top_up(1)).to eq 1
      end
      
      it 'raises error when balance exceeds max_limit' do # card doesn't exceed max limit
        max_balance = Oystercard::MAX_LIMIT
        subject.top_up(max_balance)
        expect { subject.top_up 1 }.to raise_error "Maximum balance of #{Oystercard::MAX_LIMIT} pounds exceeded"
      end
    end

    describe '#deduct(amount)' do
      
      it 'responds to deduct' do # card responds to deduct method
        expect(subject).to respond_to(:deduct).with(1).argument
      end 
      
      it 'deducts money' do # money gets deducted
        expect(subject.deduct(1)).to eq -1
      end
    end
  end # end of context 'money on card'

  context 'travel' do
  before(:each) { subject.balance = 10 }

    describe '#touch_in' do 
      
      it { is_expected.to respond_to(:touch_in).with(1).argument } # responds to tapping in
      
      it 'touches in to be in_journey' do # touches in means in_journey
        subject.touch_in(:test_entry_station)
        expect(subject.in_journey?).to eq true
      end
    end

    describe '#entry_station' do

      it 'saves the entry station' do
        subject.touch_in(:test_entry_station)
        expect(subject.entry_station).to eq :test_entry_station
      end
    end

    describe '#in_journey?' do
      
      it { is_expected.to respond_to(:in_journey?) } # responds to in_journey?
      
      it 'starts out not in journey' do # initially not in journey
        expect(subject.in_journey?).to eq false
      end
    end

    describe '#touch_out' do
      
      it { is_expected.to respond_to(:touch_out).with(1).argument } # responds to tapping out

      it 'touches out to not be in_journey' do # touches out means not in_journey
        subject.touch_out(:exit_station)
        expect(subject.in_journey?).to eq false
      end 
      it 'deducts money when tapping out' do
        expect { subject.touch_out(:test_exit_station) }.to change { subject.balance }.by(-Oystercard::MINIMUM_CHARGE)
      end
    end

    describe '#exit_station' do

      it 'saves the exit station' do
        subject.touch_in(:entry_station)
        subject.touch_out(:exit_station)
        expect(subject.exit_station).to eq :exit_station
      end
    end
  end # end of context 'travel'

  describe '#minimum_balance' do
    before(:each) { subject.balance < 1 }

    it 'won\'t touch in if below minimum balance' do
      expect { subject.touch_in(:station) }.to raise_error "You need at least #{Oystercard::MINIMUM_CHARGE} pound to tap in. Please top up."
    end
  end 
end
