require 'shot'
# class declaration for frame
class Frame
  attr_reader :number, :shots, :bonus_shots

  PINS_IN_FRAME = 10

  def initialize(number)
    @number      = number
    @shots       = { 1 => Shot.new, 2 => Shot.new }
    @bonus_shots = []
  end

  def bonus?
    !bonus_shots.map(&:taken).all?
  end

  def bonus_score
    @bonus_shots.inject(0) { |a, e| a + e.score }
  end

  def total
    score + bonus_score
  end

  def score
    shots.values.inject(0) { |a, e| a + e.score }
  end

  def bowl_bonus(pins)
    current_bonus_shot.knock_over pins
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

  def current_bonus_shot
    bonus_shots.each { |shot| return shot unless shot.taken }
  end

  def check_bonus
    2.times { add_bonus } if strike?
    add_bonus if spare?
  end

  def add_bonus
    bonus_shots.push Shot.new
  end
end
