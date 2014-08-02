require_relative 'code'           # => true
require_relative 'guesses'        # => true
require_relative 'guess_compare'  # => true


class GameFlow
	def initialize(difficulty=4)
		@difficulty = difficulty     # => 4
	end

	def intro_quote
		puts "I have generated a beginner sequence with #{@difficulty} elements made up of: (r)ed,"                                                            # => nil
		puts "(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."                                                                          # => nil
		game_flow		
	end
	
	def game_flow
		i = 0                                                                                                                                                  # => 0
		code = generate_code                                                                                                                                   # => ["G", "G", "G", "B"]
		  puts "What's your guess?"                                                                                                                            # => nil
		  input = gets.chomp                                                                                                                                       # => "rgby"
		  player_guess   = Guesses.new(input)                                                                                                                  # => #<Guesses:0x000001010b4e90 @guess=["r", "g", "b", "y"]>
		  results = GuessCompare.new(player_guess.guess, code)                                                                                                 # => #<GuessCompare:0x000001010b45f8 @guess=["r", "g", "b", "y"], @code=["G", "G", "G", "B"]>
		  puts results.colors_correct                                                                                                                          # => nil
		while results.positions_correct != code.length                                                                                                         # => true
		  i += 1		                                                                                                                                             # => 1
		  puts "Nice try"                                                                                                                                      # => nil
		  puts "#{player_guess.guess.join} has #{results.colors_correct} of the correct elements with #{results.positions_correct} in the correct positions."  # => nil
		  puts "You've taken #{i} guess."                                                                                                                      # => nil
		  puts "Try again"                                                                                                                                     # => nil
		  input   = gets.chomp                                                                                                                                 # ~> NoMethodError: undefined method `chomp' for nil:NilClass
		  player_guess   = Guesses.new(input)
		  results = GuessCompare.new(player_guess.guess, code)
		end
		puts "Hey you got it! You're a true MasterMind."
	end

	def generate_code
		code = Code.new(@difficulty)  # => #<Code:0x000001010b6538 @difficulty=4>
		code = code.code_generator    # => ["G", "G", "G", "B"]
	end  
end


# >> I have generated a beginner sequence with 4 elements made up of: (r)ed,
# >> (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
# >> What's your guess?
# >> 0
# >> Nice try
# >> rgby has 0 of the correct elements with 0 in the correct positions.
# >> You've taken 1 guess.
# >> Try again

# ~> NoMethodError
# ~> undefined method `chomp' for nil:NilClass
# ~>
# ~> /Users/Home/Desktop/MasterMind/lib/player_interaction.rb:31:in `game_flow'
# ~> /Users/Home/Desktop/MasterMind/lib/player_interaction.rb:14:in `intro_quote'
# ~> /Users/Home/Desktop/MasterMind/lib/player_interaction.rb:46:in `<main>'
