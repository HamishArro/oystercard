require 'oystercard'

describe OysterCard do

  describe " #balance" do

    it "should have a default balance of 0" do
      expect(subject.balance).to eq 0
    end

    it "should increase balance by 10" do
      subject.top_up(10)
      expect(subject.balance).to eq(10)
    end

    it "should expect error when trying to add more than 90" do
      expect { subject.top_up(100) }.to raise_error("amount takes balance passed limit: 90")
    end

  end

  it "should return a boolean when asked if on a journey" do
    expect(subject.in_journey?).to be_falsey
  end

  it "should have an empty list of journeys" do
    expect(subject.journeys).to be_empty
  end

  let(:entry_station) {double :station}
  let(:exit_station) {double :station}
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  it "should store a journey" do
    subject.top_up(10)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.journeys).to include journey
  end

  describe " #touch_out" do

    it "should be able to touch out" do
      expect(subject).to respond_to(:touch_out)
    end

    it "should deduct minimum fare" do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.balance).to eq 9
    end

    it "should be able to store the exit station" do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.exit_station).to eq exit_station
    end

  end

  describe " #touch_in" do

    it "raises an error if there is insufficient balance when touched in" do
      expect { subject.touch_in(entry_station) }.to raise_error "insufficient balance"
    end

    it "should be able to touch in" do
      expect(subject).to respond_to(:touch_in).with(1).argument
    end

    it "should remember the entry station after the touch in" do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end

  end
end
