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
		@first_shot ? @second_shot = pins : @first_shot = pins
	end
end
