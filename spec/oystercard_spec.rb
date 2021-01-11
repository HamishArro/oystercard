require 'oystercard'

describe OysterCard do

  it "should have a default balance of 0" do
    expect(subject.balance).to eq 0
  end

  it "should increase balance by 10" do
    subject.top_up(10)
    expect(subject.balance).to eq(10)
  end

  it "should decrease balance by 10" do
    subject.top_up(10)
    subject.deduct(10)
    expect(subject.balance).to eq(0)
  end

  it "should expect error when trying to add more than 90" do
    expect { subject.top_up(100) }.to raise_error("amount takes balance passed limit: 90")
  end

  it "should be able to touch in" do
    expect(subject).to respond_to(:touch_in).with(1).argument
  end

  it "should be able to touch out" do
    expect(subject).to respond_to(:touch_out)
  end

  it "should return a boolean when asked if on a journey" do
    expect(subject.in_journey?).to be_falsey
  end

  it "raises an error if there is insufficient balance when touched in" do
    expect { subject.touch_in("station") }.to raise_error "insufficient balance"
  end

end
