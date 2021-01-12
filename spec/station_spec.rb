require 'station'

describe Station do

  it "should have a name" do
    station = Station.new("Kingston station", 0)
    expect(station.name).to eq "Kingston station"
  end

  it "should have a time zone" do
    station = Station.new("Grand Central Terminal", -5)
    expect(station.time_zone).to eq -5
  end

end
