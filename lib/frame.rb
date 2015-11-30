require 'shot'
# class declaration for frame
class Frame
  attr_reader :number, :first_shot, :second_shot, :bonus

  PINS_IN_GAME = 10

  def initialize(number)
    @first_shot  = Shot.new
    @second_shot = Shot.new
    @number      = number
    @bonus       = 0
  end

  def total
    score + bonus
  end

  def score
    first_shot.score + second_shot.score
  end

  def add_bonus(pins)
    @bonus += pins
  end

  def pins_remaining
    PINS_IN_GAME - score
  end

  def spare?
    !strike? && score == PINS_IN_GAME
  end

  def strike?
    first_shot.score == PINS_IN_GAME
  end

  def complete?
    first_shot.taken && second_shot.taken || strike?
  end

  def current_shot
    first_shot.taken ? second_shot : first_shot
  end

  def bowl(pins)
    fail IllegalShotError if pins > pins_remaining
    current_shot.knock_over pins
  end
end
