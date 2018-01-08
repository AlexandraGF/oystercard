class Oystercard
  attr_reader :balance
  DEFAULT_CONSTANT = 0
  LIMIT = 90

  def initialize(balance = DEFAULT_CONSTANT)
    @balance = balance
  end

  def top_up(value)
    raise "Balance limit is #{LIMIT}" if @balance + value >= LIMIT
    @balance += value
  end

  def deduct(fare)
    @balance -= fare 
  end

end
