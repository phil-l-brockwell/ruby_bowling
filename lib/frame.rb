# class declaration for frame
class Frame
  attr_reader :first_shot_score, :number, :second_shot_score,
              :pins_remaining, :completed, :first_shot_taken

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

  def bowl(pins)
    fail FrameOverError if completed
    fail TooManyPinsError if pins > pins_remaining
    @pins_remaining -= pins
    first_shot_taken ? second_shot(pins) : first_shot(pins)
  end

  private

  def first_shot(pins)
    @first_shot_score = pins
    complete if strike?
    @first_shot_taken = true
  end

  def second_shot(pins)
    @second_shot_score = pins
    complete
  end
end
