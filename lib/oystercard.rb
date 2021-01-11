class OysterCard

  DEFAULT_LIMIT = 90
  DEFAULT_MIN = 1
  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
  end

  def in_journey?
    !!@entry_station
  end

  def top_up(amount)
    raise "amount takes balance passed limit: #{DEFAULT_LIMIT}" if balance + amount > DEFAULT_LIMIT
    @balance += amount
  end

  def touch_in(station)
    raise "insufficient balance" if @balance < DEFAULT_MIN
    @entry_station = station
  end

  def touch_out
    deduct(DEFAULT_MIN)
    @entry_station = nil
  end

  private

    def deduct(amount)
      @balance -= amount
    end

end
