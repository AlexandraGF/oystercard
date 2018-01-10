require 'station'

describe Station do
  describe '#name' do

  it 'station responds to name method' do
      expect(Station.new("dalston", "zone1")).to respond_to(:name)
    end

    it 'station.name returns name of station' do
      station = Station.new("brixton", "zone1")
      expect(station.name).to eq("brixton")
    end

  describe '#zone' do

  it 'station responds to zone method' do
    expect(Station.new("stockwell", "zone1")).to respond_to(:zone)
  end

  end
  end
end
