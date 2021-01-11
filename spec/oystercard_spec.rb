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

  describe " #touch_out" do

    it "should be able to touch out" do
      expect(subject).to respond_to(:touch_out)
    end

    it "should deduct minimum fare" do
      subject.top_up(10)
      subject.touch_in("station")
      subject.touch_out
      expect(subject.balance).to eq 9
    end

  end

  describe " #touch_in" do

    it "raises an error if there is insufficient balance when touched in" do
      expect { subject.touch_in("station") }.to raise_error "insufficient balance"
    end

    it "should be able to touch in" do
      expect(subject).to respond_to(:touch_in).with(1).argument
    end

    it "should remember the entry station after the touch in" do
      subject.top_up(10)
      station = double("test station")
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end

  end
end
