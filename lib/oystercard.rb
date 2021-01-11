class OysterCard
  DEFAULT_LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_use
  end

  def top_up(amount)
    raise "amount takes balance passed limit: #{DEFAULT_LIMIT}" if balance + amount > DEFAULT_LIMIT
    @balance += amount
  end

  def touch_in(event)
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

end
