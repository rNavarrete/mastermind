



############# Code and Guess result processor ################ 
############# 																################





if no_colors_right == no_of_correct_in_correct_place
	"Hey great job. You figured out the code."
else
	"Give it another shot."
	### Game Sequence ####	













###################  Code for number of colors correct ######################
#################### 																	 #######################
code = ["g", "r", "y", "g"]  # => ["g", "r", "y", "g"]
code_uniq = code.uniq        # => ["g", "r", "y"]
code_uniq                    # => ["g", "r", "y"]
guess = ["r","g","b","y"]    # => ["r", "g", "b", "y"]
guess_uniq = guess.uniq      # => ["r", "g", "b", "y"]
guess_uniq.join              # => "rgby"

no_colors_right = Array.new                                                             # => []
code_uniq.each { |letter| no_colors_right << true if letter =~ /[#{guess_uniq.join}]/}  # => ["g", "r", "y"]

no_colors_right  # => [true, true, true]


puts "You got #{no_colors_right.length} colors correct."  # => nil

# >> You got 3 colors correct.
