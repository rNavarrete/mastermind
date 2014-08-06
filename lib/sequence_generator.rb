class SequenceGenerator
  attr_reader :difficulty

	def initialize(difficulty)
		@difficulty = difficulty
	end

	def secret_code
		case difficulty
		when 4	
			beginner_pool
		when 6 
			intermediate_pool
		when 8
			hard_pool
		end
	end

	def beginner_pool
		beginner_pool = ["R", "G", "B", "Y"]
		code = (1..difficulty).map {beginner_pool.sample}
	end

	def intermediate_pool
    intermediate_pool = ["R", "G", "B", "Y", "P"]
		code = (1..difficulty).map {intermediate_pool.sample}		
	end

	def hard_pool
    hard_pool = ["R", "G", "B", "Y", "P", "O"]
	  code = (1..difficulty).map {hard_pool.sample}		
	end

end