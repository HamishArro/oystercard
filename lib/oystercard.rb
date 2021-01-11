class OysterCard

  DEFAULT_LIMIT = 90
  DEFAULT_MIN = 1
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def in_journey?
    @in_use
  end

  def top_up(amount)
    raise "amount takes balance passed limit: #{DEFAULT_LIMIT}" if balance + amount > DEFAULT_LIMIT
    @balance += amount
  end

  def touch_in(event)
    raise "insufficient balance" if @balance < DEFAULT_MIN
    @in_use = true
  end

  def touch_out
    deduct(DEFAULT_MIN)
    @in_use = false
  end

  private

    def deduct(amount)
      @balance -= amount
    end

end
