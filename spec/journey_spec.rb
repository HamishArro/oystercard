require 'journey'

describe Journey do

  it "should return a boolean when asked if on a journey" do
    expect(subject.in_journey?).to be_falsey
  end

  let(:entry_station) {double :station}
  let(:exit_station) {double :station}

  it "should be able to store the exit station" do
    subject.start_journey(entry_station)
    subject.finish_journey(exit_station)
    expect(subject.exit_station).to eq exit_station
  end

  it "should remember the entry station" do
    subject.start_journey(entry_station)
    expect(subject.entry_station).to eq entry_station
  end

end
