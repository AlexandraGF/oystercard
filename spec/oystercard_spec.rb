require './lib/oystercard.rb'

describe Oystercard do
  it 'responds to top_up method' do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it 'checks oystercard balance' do
    expect(subject.balance).to eq(0)
  end

  it 'tops up oystercard' do
    expect { subject.top_up 5 }.to change{ subject.balance }.by 5
  end

  it 'raise an error if balance limit is exceeded' do
    expect { subject.top_up(90) }.to raise_error("Balance limit is #{Oystercard::LIMIT}")
  end
end
