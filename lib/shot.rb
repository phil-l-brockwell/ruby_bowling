# Defines the shot class
class Shot
  attr_reader :taken, :score

  def initialize
    @score = 0
    @taken = false
  end

  def knock_over(pins)
    @score = pins
    @taken = true
  end
end
