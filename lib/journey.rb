
class Journey
attr_reader :entry_station, :exit_station

MINIM = 1
PENALTY = 6

def initialize(entry_station = nil)
  @entry_station = entry_station
  @exit_station = nil
  @history = []
end

def finish(exit_station)
  @exit_station = exit_station
end

def fare
  return PENALTY if complete?
  MINIM
end

def add_journeys
  entry_station = @entry_station
  exit_station = @exit_station
  @journeys << { :entry_station => entry_station, :exit_station => exit_station}
end

private

def complete?
  @entry_station == nil || @exit_station == nil
end




















# attr_reader :entry_station, :exit_station
#
# MINIM = 1
#
# def initialize
#   @entry_station = entry_station
#   @exit_station = exit_station
#   @journey = []
# end
#
# def touch_in(entry_station)
#
#   @journey << Station.new
# end
#
# def touch_out
#
# end

end
