require 'shot'
# class declaration for frame
class Frame
  attr_reader :first_shot, :number, :second_shot, :pins_remaining

  PINS_IN_GAME = 10

  def initialize(number)
    @first_shot  = Shot.new
    @second_shot = Shot.new
    @number      = number
  end

  def score
    first_shot.score + second_shot.score
  end

  def pins_remaining
    PINS_IN_GAME - score
  end

  def spare?
    score == PINS_IN_GAME && !strike?
  end

  def strike?
    first_shot.score == PINS_IN_GAME
  end

  def complete?
    first_shot.taken && second_shot.taken || strike?
  end

  def bowl(pins)
    fail FrameOverError if complete?
    fail TooManyPinsError if pins > pins_remaining
    first_shot.taken ? second_shot.hit(pins) : first_shot.hit(pins)
  end
end
