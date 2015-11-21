# class declaration for frame
class Frame
  attr_reader :total_score, :first_shot_score, :number,
              :second_shot_score, :pins_remaining, :completed

  PINS_IN_GAME = 10

  def initialize(number)
    @completed         = false
    @first_shot_score  = 0
    @second_shot_score = 0
    @pins_remaining    = PINS_IN_GAME
    @number            = number
  end

  def score
    first_shot_score + second_shot_score
  end

  def spare?
    score == PINS_IN_GAME && !strike?
  end

  def strike?
    first_shot_score == PINS_IN_GAME
  end

  def complete
    @completed = true
  end

  def first_shot(pins)
    fail FrameOverError if completed
    fail TooManyPinsError if pins > @pins_remaining
    @first_shot_score = pins
    @pins_remaining -= pins
    complete if strike?
  end

  def second_shot(pins)
    fail FrameOverError if completed
    fail TooManyPinsError if pins > @pins_remaining
    @second_shot_score = pins
    @pins_remaining -= pins
    complete
  end
end
