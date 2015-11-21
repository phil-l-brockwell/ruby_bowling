# class declaration for game class
class Game

	attr_reader :games

	def initialize(frames)
		@games = 1.upto(frames).map { |frame| Frame.new }
	end
end
