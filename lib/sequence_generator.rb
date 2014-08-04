class SequenceGenerator
	attr_reader :difficulty

	def initialize(difficulty)
		@difficulty = difficulty
	end

	def secret_code
		pool = ["r", "g", "b", "y"]

		code = []
		difficulty.times do
			random_letter = pool.sample
			code << random_letter			
		end
		code
	end
end
