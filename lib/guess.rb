class Guess
	attr_reader :code, :difficulty

	def initialize(input, difficulty=4)
		@code = input.downcase.split(//)
		@difficulty = difficulty
	end

	def count
		@code.length
	end

	def guess_as_string
		@code.join
	end

	def valid?
		if guess_too_long? or guess_too_short
			false
		elsif valid_characters? == false
		  false
		else
		  true
		end    	
	end

	def guess_too_long?
	  code.length > difficulty ? true:false
	end	

  def guess_too_short?
    code.length < difficulty ? true:false
	end	  

	def invalid_characters?
		@code.any? {|letter| letter =~ /[^grbyop]/}
	end
end


