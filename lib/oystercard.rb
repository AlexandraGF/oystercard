class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys, :current_journey

  DEFAULT_CONSTANT = 0
  LIMIT = 90
  MINIM = 1

  def initialize(balance = DEFAULT_CONSTANT, history = Journey )
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
    @current_journey = Journey.new
    @current_journey = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIM)
    @exit_station = exit_station
    @current_journey[exit_station] =   @exit_station
    add_journeys
    @entry_station = nil
  end

  def add_journeys
    # @journeys << { :entry_station => entry_station, :exit_station => exit_station}
    @journeys << @current_journey
  end

  private
  def deduct(fare)
    @balance -= fare
  end

end
