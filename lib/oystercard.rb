class Oystercard
  attr_reader :balance, :in_journey
  MAX_LIMIT = 90
  BALANCE = 0

  def initialize
    @balance = BALANCE
    @in_journey = false
  end

  def top_up(amount)
    fail 'Maximum balance of #{Oystercard::MAX_LIMIT} pounds exceeded' if amount + balance > MAX_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def in_journey?
    @in_journey
  end

  def touch_out
    @in_journey = false
    true
  end 
end
