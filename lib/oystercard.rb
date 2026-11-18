require_relative 'journey'

class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys, :current_journey

  DEFAULT_CONSTANT = 0
  LIMIT = 90
  MINIM = 1

  def initialize(balance = DEFAULT_CONSTANT, journey_class = Journey)
    raise ArgumentError, 'Invalid starting balance' unless balance.is_a?(Numeric) && balance.finite? && balance >= 0 && balance < LIMIT
    @balance = balance
    @journeys = []
    @journey_class = journey_class
  end

  def top_up(value)
    raise ArgumentError, 'Top-up must be a positive finite amount' unless value.is_a?(Numeric) && value.finite? && value > 0
    raise "Balance limit is #{LIMIT}" if @balance + value >= LIMIT
    @balance += value
  end

  def in_journey?
    !@current_journey.nil?
  end

  def touch_in(entry_station)
    if @current_journey
      deduct(@current_journey.fare)
      add_journeys
      @current_journey = nil
      @entry_station = nil
    end
    raise 'Not enough money' if @balance < MINIM
    @entry_station = entry_station
    @current_journey = @journey_class.new(entry_station)
  end

  def touch_out(exit_station)
    @current_journey ||= @journey_class.new
    @current_journey.finish(exit_station)
    deduct(@current_journey.fare)
    @exit_station = exit_station
    add_journeys
    @current_journey = nil
    @entry_station = nil
  end

  def add_journeys
    @journeys << { entry_station: @current_journey.entry_station, exit_station: @current_journey.exit_station }
  end

  private

  def deduct(fare)
    @balance -= fare
  end
end
