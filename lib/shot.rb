# Defines the shot class
class Shot
  attr_reader :taken, :pins_remaining, :score

  def initialize
    @taken = false
    @score = 0
  end

  def knock_over(pins)
    @score += pins
    @taken = true
  end
end
