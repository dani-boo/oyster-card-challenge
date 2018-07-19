class Oystercard
  attr_accessor :balance, :in_journey
  attr_reader :entry_station, :exit_station
  MAX_LIMIT = 90
  STARTING_BALANCE = 0
  MINIMUM_CHARGE = 1

  def initialize
    @balance = STARTING_BALANCE
    @in_journey = false
  end

  def top_up(amount)
    raise "Maximum balance of #{Oystercard::MAX_LIMIT} pounds exceeded" if amount + balance > MAX_LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
    raise "You need at least #{Oystercard::MINIMUM_CHARGE} pound to tap in. Please top up." if balance < MINIMUM_CHARGE
    @entry_station = entry_station
  end

  def in_journey?
    !!entry_station
  end

  def touch_out(exit_station)
    @exit_station = exit_station
    deduct(MINIMUM_CHARGE)
  end 

  def deduct(amount)
    @balance -= amount
  end
end
