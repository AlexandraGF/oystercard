class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys
  DEFAULT_CONSTANT = 0
  LIMIT = 90
  MINIM = 1

  def initialize(balance = DEFAULT_CONSTANT)
    @balance = balance
    @journeys = []
  end

  def top_up(value)
    raise "Balance limit is #{LIMIT}" if @balance + value >= LIMIT
    @balance += value
  end

  def in_journey?
    !!entry_station
  end


  def touch_in(entry_station)
    raise "Not enough money" if @balance < MINIM
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIM)
    @exit_station = exit_station
    add_journeys
    @entry_station = nil
  end

  def add_journeys
    entry_station = @entry_station
    exit_station = @exit_station
    @journeys << { :entry_station => entry_station, :exit_station => exit_station}
  end

  private
  def deduct(fare)
    @balance -= fare
  end

end
