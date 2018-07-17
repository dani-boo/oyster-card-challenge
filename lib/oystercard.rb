class Oystercard
  attr_reader :balance
  MAX_LIMIT = 90
  BALANCE = 0

  def initialize
    @balance = BALANCE
  end

  def top_up(amount)
    fail 'Maximum balance exceeded' if amount + balance > MAX_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
end
