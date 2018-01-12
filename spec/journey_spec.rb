require 'journey'

describe Journey do
  subject(:journey) { described_class.new(entry_station) }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }


  it 'check if we have entry station' do
  expect(journey.entry_station).to eq(entry_station)
  end

  it 'check that we don\'t have exit station when we touch in' do
    expect(journey.exit_station).to be nil
  end

  it 'sets the exit station' do
    journey.finish(exit_station)
    expect(journey.exit_station).to eq(exit_station)
  end

  it 'returns the fare' do
    journey.finish(exit_station)
    expect(journey.fare).to eq(Journey::MINIM)
  end

  it 'get a penalty fare if no entry station available' do
    no_entry_journey = Journey.new
    no_entry_journey.finish(exit_station)
    expect(no_entry_journey.fare).to eq(Journey::PENALTY)
  end

  it 'get a penalty fare if no exit station available' do
    expect(journey.fare).to eq(Journey::PENALTY)
  end
end
