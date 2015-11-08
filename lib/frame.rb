class Frame

	attr_reader :score, :first_shot, :second_shot

	def initialize
		@complete = false
	end

	def complete?
		@complete
	end

	def completed
		@complete = true
	end

	def bowl(pins)
		@second_shot = pins if @first_shot
		@first_shot = pins
	end
end
