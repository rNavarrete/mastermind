require_relative 'code'           # => true
require_relative 'guesses'        # => true
require_relative 'guess_compare'  # => true


class GameFlow
	def initialize(difficulty=4)
		@difficulty = difficulty
	end

	def intro_quote
		puts ""
		puts "I have generated a beginner sequence with #{@difficulty} elements made up of: (r)ed,"
		puts "(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
		puts "What's your guess?"
		game_flow		
	end
	
	def game_flow
		@i = 0
		generate_code
		@input = gets.chomp
		@time1 = Time.now
		create_player_guess
		process_code_and_player_guess
		while @results.positions_correct != @code.length
		  @i += 1
		  puts "#{@player_guess.guess.join} has #{@results.colors_correct} of the correct elements with #{@results.positions_correct} in the correct positions."
		  puts "You've taken #{@i} guess."
		  @input = gets.chomp
		  create_player_guess
		  @results = GuessCompare.new(@player_guess.guess, @code)
		end
		@time2 = Time.now
		@time3 = @time2 - @time1
		winning_message
	end

	def process_code_and_player_guess
		@results = GuessCompare.new(@player_guess.guess, @code)
		@results
	end

	def create_player_guess
		@player_guess = Guesses.new(@input)
		@player_guess
	end

  def winning_message
 	  puts "" 
    puts "Hey you got it! You're a true MasterMind."	
    puts "Congratulations! You guessed the sequence #{@code.join} in #{@i} guesses over about #{@time3.round / 60} minutes."
  end

	def generate_code
		code = Code.new(@difficulty)
		@code = code.code_generator
		@code
	end  
end

