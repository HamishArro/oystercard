require 'oystercard'

describe OysterCard do

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
