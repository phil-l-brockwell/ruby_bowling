# class declaration for game class
class Game
  attr_reader :frames

  def initialize(frames)
    @frames = {}
    1.upto(frames).each { |num| @frames[num] = Frame.new(num) }
  end

  def current_frame
    @frames.each { |_, frame| return frame unless frame.completed }
  end

  def bowl(pins)
    current_frame.bowl pins
  end
end
