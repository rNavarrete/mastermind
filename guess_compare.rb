class GuessCompare
	

	def	number_correct(guess, code)
    results = code.zip(guess).collect {|x, y| x == y }
    num_correct = results.find_all {|compare| compare == true}.length
    num_correct
	end


end
