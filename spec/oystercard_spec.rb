require './lib/oystercard.rb'

describe Oystercard do
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

  it 'deducting from the oystercard balance' do
    expect { subject.deduct 2.40 }.to change{ subject.balance }.by -2.40
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
    subject.touch_in
    expect(subject.in_journey?).to be true
  end

  it 'touch out to change in_journey to be false' do
    subject.touch_out
    expect(subject.in_journey?).to be false
  end

end
