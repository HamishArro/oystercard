class OysterCard
  DEFAULT_LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "amount takes balance passed limit: #{DEFAULT_LIMIT}" if balance + amount > DEFAULT_LIMIT
    @balance += amount
  end

end
