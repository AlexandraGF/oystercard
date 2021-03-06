require './lib/oystercard.rb'

describe Oystercard do

  let(:entry_station){ double :entry_station, name: "Stockwell"}
  let(:exit_station) { double :exit_station, name: "Brixton" }

  it 'checks oystercard balance' do
    expect(subject.balance).to eq(0)
  end

  it 'responds to top_up method' do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it 'tops up oystercard' do
    expect { subject.top_up 5 }.to change{ subject.balance }.by 5
  end

  it 'raise an error if balance limit is exceeded' do
    expect { subject.top_up(90) }.to raise_error("Balance limit is #{Oystercard::LIMIT}")
  end

  it 'Checking if we are in our journey' do
    allow(subject).to receive(:in_journey?).and_return(true)
    expect(subject.in_journey?).to be true
  end

  it 'Checking if we are not in our journey' do
    allow(subject).to receive(:in_journey?).and_return(false)
    expect(subject.in_journey?).to be false
  end

  it 'touch in to change in_journey to be true' do
    subject.top_up(Oystercard::MINIM)
    subject.touch_in(entry_station)
    expect(subject.in_journey?).to be true
  end

  it 'touch out to change in_journey to be false' do
    subject.touch_out(exit_station)
    expect(subject.in_journey?).to be false
  end

  it 'raise error when not enough money' do
    expect { subject.touch_in(entry_station) }.to raise_error("Not enough money")
  end

  it 'deduct the fare when touch_out' do
    expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by (-Oystercard::MINIM)
  end

  it 'remember the entry station when touch in' do
    subject.top_up(5)
    subject.touch_in(entry_station.name)
    expect(subject.entry_station).to eq("Stockwell")
  end

  it 'stores exit station' do
    subject.top_up(6)
    subject.touch_in(entry_station.name)
    subject.touch_out(exit_station.name)
    expect(subject.exit_station).to eq("Brixton")
  end

  it 'check that card has empty list of journeys by default' do
    expect(subject.journeys).to eq []
  end

  it 'check that touching in and out creates one journey' do
    subject.top_up(5)
    subject.touch_in(entry_station.name)
    subject.touch_out(exit_station.name)
    expect(subject.journeys).to eq ([{ :entry_station => "Stockwell", :exit_station => "Brixton"}])
  end

end
