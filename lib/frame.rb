require 'shot'
# class declaration for frame
class Frame
  attr_reader :number, :first_shot, :second_shot, :bonus_score, :bonus_rolls

  PINS_IN_FRAME = 10
  BONUS_ROLL   = 1
  STRIKE_BONUS = 2 * BONUS_ROLL
  SPARE_BONUS  = 1 * BONUS_ROLL

  def initialize(number)
    @number      = number
    @first_shot  = Shot.new
    @second_shot = Shot.new
    @bonus_score = @bonus_rolls = 0
  end

  def total
    score + bonus_score
  end

  def score
    first_shot.score + second_shot.score
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
    first_shot.score == PINS_IN_FRAME
  end

  def complete?
    first_shot.taken && second_shot.taken || strike?
  end

  def bowl(pins)
    fail IllegalShotError if pins > pins_remaining
    current_shot.knock_over pins
    calc_bonus if complete?
  end

  private

  def current_shot
    first_shot.taken ? second_shot : first_shot
  end

  def calc_bonus
    @bonus_rolls += STRIKE_BONUS if strike?
    @bonus_rolls += SPARE_BONUS  if spare?
  end
end
