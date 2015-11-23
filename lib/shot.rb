# Defines the shot class
class Shot
  attr_reader :complete, :score

  def initialize
    @complete = false
  end

  def hit(pins)
    @score = pins
    @complete = true
  end
end
