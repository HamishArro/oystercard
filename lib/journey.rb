class Journey
  attr_reader :log, :exit_station, :entry_station
  DEFAULT_MIN = 1

  def initialize
    @log = Hash.new
  end

  def start_journey(station)
    @log[:entry_station] = (@entry_station = station)
  end

  def finish_journey(station)
    @log[:exit_station] = (@exit_station = station)
  end

  def fare
    return DEFAULT_MIN if @entry_station != nil
    6
  end

  def in_journey?
    !!@entry_station
  end

end
