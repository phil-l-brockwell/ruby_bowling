require 'shot'
# class declaration for frame
class Frame
  attr_reader :number, :bonus_score, :bonus_rolls, :shots

  PINS_IN_FRAME = 10
  BONUS_ROLL    = 1
  STRIKE_BONUS  = 2 * BONUS_ROLL
  SPARE_BONUS   = 1 * BONUS_ROLL

  def initialize(number)
    @number      = number
    @shots       = { 1 => Shot.new, 2 => Shot.new }
    @bonus_score = 0
    @bonus_rolls = 0
  end

  def total
    score + bonus_score
  end

  def score
    shots.values.inject(0) { |a, e| a + e.score }
  end

  def bowl_bonus(pins)
    @bonus_score += pins
    @bonus_rolls -= BONUS_ROLL
  end

  def pins_remaining
    PINS_IN_FRAME - score
  end

  def spare?
    !strike? && score == PINS_IN_FRAME
  end

  def strike?
    shots[1].score == PINS_IN_FRAME
  end

  def complete?
    shots.values.map(&:taken).all? || strike?
  end

  def bowl(pins)
    fail IllegalShotError if pins > pins_remaining
    current_shot.knock_over pins
    check_bonus
  end

  private

  def current_shot
    shots.values.each { |shot| return shot unless shot.taken }
  end

  def check_bonus
    @bonus_rolls += STRIKE_BONUS if strike?
    @bonus_rolls += SPARE_BONUS  if spare?
  end
end
