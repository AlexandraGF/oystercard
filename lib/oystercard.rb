class Oystercard
  attr_reader :balance
  DEFAULT_CONSTANT = 0

  def initialize(balance = DEFAULT_CONSTANT)
    @balance = balance
  end
end
