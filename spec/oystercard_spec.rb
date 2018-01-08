require './lib/oystercard.rb'

describe Oystercard do
  it 'responds to top_up method' do
    expect(subject).to respond_to(:top_up).with(1).argument  
  end

  it 'checks oystercard balance' do
    expect(subject.balance).to eq(0)
  end

  it 'tops up oystercard' do
    oyster = Oystercard.new
    oyster.top_up(5)
    expect(oyster.balance).to eq(5)
  end
end
