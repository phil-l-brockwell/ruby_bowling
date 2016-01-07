require 'shot_holder'
# class declaration for frame
class Frame
  attr_reader :number, :shots, :bonus_shots

  PINS_IN_FRAME = 10

  def initialize(number)
    @number      = number
    @shots       = ShotHolder.new(2)
    @bonus_shots = ShotHolder.new
  end

  def bonus?
    bonus_shots.remaining?
  end

  def total
    score + bonus_score
  end

  def score
    shots.total
  end

  def bonus_score
    bonus_shots.total
  end

  def bowl_bonus(pins)
    bonus_shots.current.knock_over pins
  end

  def pins_remaining
    PINS_IN_FRAME - shots.total
  end

  def spare?
    !strike? && shots.total == PINS_IN_FRAME
  end

  def strike?
    shots.first.score == PINS_IN_FRAME
  end

  def complete?
    !shots.remaining? || strike?
  end

  def bowl(pins)
    fail IllegalShotError if pins > pins_remaining
    shots.current.knock_over pins
    check_bonus
  end

  private

  def check_bonus
    2.times { bonus_shots.add_shot } if strike?
    bonus_shots.add_shot if spare?
  end
end
