class Guess
	def initialize(user_guess)
		@guess = user_guess.split(//)

	end

	def count
		@guess.length
	end

end