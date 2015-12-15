# class declaration for game class
class Game
  attr_reader :frames

  EMPTY_FRAME = Frame.new(0)

  def initialize(frames = 10)
    @frames = Hash[(1..frames - 1).map { |x| [x, Frame.new(x)] }]
    @frames[frames] = FinalFrame.new(frames)
  end

  def current_frame
    frames.each { |_, frame| return frame unless frame.complete? }
  end

  def pre_frame
    frames[current_frame.number - 1] || EMPTY_FRAME
  end

  def pre_pre_frame
    frames[current_frame.number - 2] || EMPTY_FRAME
  end

  def total
    frames.values.inject(0) { |a, e| a + e.total }
  end

  def bowl(pins)
    if pre_frame.bonus?
      pre_pre_frame.bowl_bonus pins if pre_pre_frame.bonus?
      pre_frame.bowl_bonus pins
    end
    current_frame.bowl pins
  end
end
