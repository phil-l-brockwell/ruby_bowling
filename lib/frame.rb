class Frame

	attr_reader :total_score, :first_shot_score, :second_shot_score

	def initialize
		@completed = false
	end

	def score
		@first_shot_score + @second_shot_score
	end

	def spare?
		score == 10 and @first_shot_score != 10
	end

	def strike?
		@first_shot_score == 10
	end

	def completed?
		@completed
	end

	def complete
		@completed = true
	end

	def first_shot(pins)
		fail FrameOverError if completed?
		@first_shot_score = pins
		complete if strike?
	end

	def second_shot(pins)
		fail FrameOverError if completed?
		@second_shot_score = pins
		complete
	end
end
