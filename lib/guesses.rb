class Guesses
	attr_reader :guess

	def initialize(input)
		@guess = input.downcase.split(//)
	end

	def count
		@guess.length
	end

	def guess_as_string
		@guess.join
	end

end