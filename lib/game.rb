# class declaration for game class
class Game
  attr_reader :frames

  def initialize(frames = 10)
    @frames = {}
    1.upto(frames).each { |num| @frames[num] = Frame.new(num) }
  end

  def previous_frame
    @frames[current_frame.number - 1]
  end

  def current_frame
    @frames.each { |_, frame| return frame unless frame.complete? }
  end

  def total
    @frames.values.inject(0) { |a, frame| a + frame.score }
  end

  def bowl(pins)
    previous_frame.add_bonus(pins) if previous_frame && previous_frame.spare? && !current_frame.first_shot.taken
    previous_frame.add_bonus(pins) if previous_frame && previous_frame.strike?
    current_frame.bowl pins
  end
end
