require 'oystercard'

describe OysterCard do

  it "should have a default balance of 0" do
    expect(subject.balance).to eq 0
  end

  it "should increase balance by 10" do
    subject.top_up(10)
    expect(subject.balance).to eq(10)
  end

end
