class Oystercard
  attr_reader :balance, :in_journey
  DEFAULT_CONSTANT = 0
  LIMIT = 90

  def initialize(balance = DEFAULT_CONSTANT)
    @balance = balance
    @in_journey = false
  end

  def top_up(value)
    raise "Balance limit is #{LIMIT}" if @balance + value >= LIMIT
    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end
