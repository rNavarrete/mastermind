class Game
	
	def code_generator(difficulty=4)
		challenge_level =  difficulty
		i               =  0
		@code           =  []
		while i < challenge_level
			random_color = Random.new
			random_color = random_color.rand(100)

			case random_color
			when  0..25
			 @code << "R"
				i += 1
			when 26..50
			 @code << "G"
			  i += 1
			when 51..75  	
		   @code << "B"
		    i += 1
		  when 76..100
		   @code << "Y"
		    i += 1
			end
		end
		@code
	end
end



	def positions_correct
		# get a real code
	  code = ["y","r","y","y"]
	  # get a real guess
	  guess = ["r", "r", "r", "r"]

	  correct_positions = 0
	  code.zip(guess)
	  matching_spaces = code.zip(guess).collect {|x, y| x == y }

	  matching_spaces
	  number_of_correct_in_correct_place = matching_spaces.find_all {|match| match == true}.length
	end


	def colors_correct
		
		code = ["g", "r", "y", "g"]
		code_uniq = code.uniq
		code_uniq
		guess = ["r","g","b","y"]
		guess_uniq = guess.uniq
		guess_uniq.join

		no_colors_right = Array.new
		code_uniq.each { |letter| no_colors_right << true if letter =~ /[#{guess_uniq.join}]/}

		no_colors_right


		puts "You got #{no_colors_right.length} colors correct."
	end
end