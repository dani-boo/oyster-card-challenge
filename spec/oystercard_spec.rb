require 'oystercard'

describe Oystercard do
  let(:station){ double :station }

  context 'money on card' do
    describe '#balance' do
      # card responds to balance method
      it 'responds to balance' do
        expect(subject).to respond_to(:balance)
      end
      # card has balance of zero
      it 'has a balance of zero' do
        expect(subject.balance).to eq(0)
      end
      # balance is an integer
      it 'checks that balance is an integer' do
        expect(subject.balance).to be_a Integer
      end
    end

    describe '#top_up' do
      # card responds to top_up method
      it 'responds to top_up with 1 argument' do
        expect(subject).to respond_to(:top_up).with(1).argument
      end
      # card can be topped up
      it 'adds top-up amount to balance' do
        expect(subject.top_up(1)).to eq 1
      end
      # card doesn't exceed max limit
      it 'raises error when balance exceeds max_limit' do
        max_balance = Oystercard::MAX_LIMIT
        subject.top_up(max_balance)
        expect { subject.top_up 1 }.to raise_error "Maximum balance of #{Oystercard::MAX_LIMIT} pounds exceeded"
      end
    end

    describe '#deduct(amount)' do
      # card responds to deduct method
      it 'responds to deduct' do
        expect(subject).to respond_to(:deduct).with(1).argument
      end 
      # money gets deducted
      it 'deducts money' do
        expect(subject.deduct(1)).to eq -1
      end
    end
  end

  context 'in journey' do
    before(:each) { subject.balance = 10 }
      describe '#touch_in' do     
      # responds to tapping in
      it { is_expected.to respond_to(:touch_in).with(1).argument }
      # touches in means in_journey
      it 'touches in to be in_journey' do
        subject.touch_in(station)
        expect(subject.in_journey?).to eq true
      end
    end

    describe '#entry_station' do
      it 'saves the entry station' do
        # puts subject.balance
        subject.touch_in(station)
        expect(subject.entry_station).to eq station
      end
    end

    describe '#in_journey?' do
      # responds to in_journey?
      it { is_expected.to respond_to(:in_journey?) }
      # initially not in journey
      it 'starts out not in journey' do
        expect(subject.in_journey?).to eq false
      end
    end

    describe '#touch_out' do
      # responds to tapping out
      it { is_expected.to respond_to(:touch_out) }
      # touches out means not in_journey
      it 'touches out to not be in_journey' do
        subject.touch_out
        expect(subject.in_journey?).to eq false
      end 
      it 'deducts money when tapping out' do
        expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::MINIMUM_CHARGE)
      end
    end
  end

  describe '#minimum_balance' do
    before(:each) { subject.balance < 1 }
    it 'won\'t touch in if below minimum balance' do
      # subject.balance < Oystercard::MINIMUM_CHARGE
      expect { subject.touch_in(station) }.to raise_error "You need at least #{Oystercard::MINIMUM_CHARGE} pound to tap in. Please top up."
    end
  end 
end
