class Frame

	attr_reader :total_score, :first_shot_score,
				:second_shot_score, :pins_remaining

	def initialize
		@completed = false
		@first_shot_score = 0
		@second_shot_score = 0
		@pins_remaining = 10
	end

	def score
		@first_shot_score + @second_shot_score
	end

	def spare?
		score == 10 and !strike?
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
		@pins_remaining -= pins
		complete if strike?
	end

	def second_shot(pins)
		fail FrameOverError if completed?
		@second_shot_score = pins
		@pins_remaining -= pins
		complete
	end
end
