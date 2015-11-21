# class declaration for game class
class Game

	attr_reader :frames

	def initialize(frames)
		@frames = 1.upto(frames).map { |number| Frame.new(number) }
	end

	def current_frame
		@frames.each { |frame| return frame unless frame.completed }
	end
end
