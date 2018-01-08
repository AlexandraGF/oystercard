class Oystercard
  attr_reader :balance
  DEFAULT_CONSTANT = 0

  def initialize(balance = DEFAULT_CONSTANT)
    @balance = balance
  end

  def top_up(value)
    @balance += value
  end

end
