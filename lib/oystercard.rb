class Oystercard
  attr_reader :balance, :in_journey
  DEFAULT_CONSTANT = 0
  LIMIT = 90
  MINIM = 1

  def initialize(balance = DEFAULT_CONSTANT)
    @balance = balance
    @in_journey = false
  end

  def top_up(value)
    raise "Balance limit is #{LIMIT}" if @balance + value >= LIMIT
    @balance += value
  end

  def in_journey?
    @in_journey
  end


  def touch_in
    raise "Not enough money" if @balance < MINIM
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MINIM)
  end

  private
  def deduct(fare)
    @balance -= fare
  end

end
