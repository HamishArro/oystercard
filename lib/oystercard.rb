require 'journey.rb'

class OysterCard

  DEFAULT_LIMIT = 90
  attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize
    @balance = 0
    @journeys = Array.new
  end

  def top_up(amount)
    raise "amount takes balance passed limit: #{DEFAULT_LIMIT}" if balance + amount > DEFAULT_LIMIT
    @balance += amount
  end

  def touch_in(station)
    raise "insufficient balance" if @balance < Journey::DEFAULT_MIN
    if @journey == nil
      @journey = Journey.new
      @journey.start_journey(station)
    else
      deduct(6)
      @journey = nil
      touch_in(station)
    end
  end

  def touch_out(station)
    @journey = Journey.new if @journey == nil
    @journey.finish_journey(station)
    @journeys << @journey.log
    deduct(@journey.fare)
    @journey = nil
  end

  private

    def deduct(amount)
      @balance -= amount
    end

end
