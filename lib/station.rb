class Station
  attr_reader :name, :time_zone

  def initialize(name, time_zone)
    @name = name
    @time_zone = time_zone
  end

end
