class GuessCompare
	attr_reader :guess, :code

	def initialize(guess, code)
		@guess = guess
		@code  = code
	end
	
	def	positions_correct
    results     = @code.zip(@guess).collect {|x, y| x == y }
    num_correct = results.find_all {|compare| compare == true}.length
    num_correct
	end

	def colors_correct
		remove_code_repeated_elements
		guess_remove_doubles_and_to_string
		colors_correct = @code_no_repeats.find_all {|letter| letter =~ /[#{@guess_string}]/}
		colors_correct = colors_correct.empty? ? 0 : colors_correct.length
	end

	def remove_code_repeated_elements
		@code_no_repeats  = @code.uniq
	end

	def guess_remove_doubles_and_to_string
		@guess_no_repeats = @guess.uniq
		@guess_string     = @guess_no_repeats.join
	end
end

