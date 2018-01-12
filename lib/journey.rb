
class Journey
  attr_reader :entry_station, :exit_station

  MINIM = 1
  PENALTY = 6

  def initialize
    @entry_station = entry_station
    @exit_station = nil
  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  def fare
    return PENALTY if complete?
    MINIM
  end

  # def add_journeys(entry_station, exit_station)
  #   entry_station = Oystercard.touch_in(entry_station)
  #   exit_station = Oystercard.touch_out(exit_station)
  #   @history << { :entry_station => entry_station, :exit_station => exit_station}
  # end

  private

  def complete?
    @entry_station == nil || @exit_station == nil
  end
end
