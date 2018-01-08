require './lib/oystercard.rb'
describe Oystercard do
  it 'checks oystercard balance' do
    expect(subject.balance).to eq(0)
  end
end
