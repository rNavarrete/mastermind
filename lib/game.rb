require_relative 'sequence_generator'           # => true
require_relative 'guess'        # => true
require_relative 'guess_compare'  # => true
require_relative 'user_messages'
require 'colorize'


class Game
	attr_reader :difficulty, :secret_code, :player_guess, :results, :time1, :messages
	
	def initialize(difficulty=4)
		@difficulty = difficulty
		generate_code
		@messages = UserMessages.new
	end

	def intro_message
		puts ""
		puts "I have generated a sequence with #{difficulty} elements made up of:" + "#{difficulty == 8 ? "(o)range":nil}".colorize(:light_red) + " (r)ed".colorize(:red)
		puts "(g)reen".colorize(:green)+ ", "+ "(b)lue".colorize(:blue) + ", #{difficulty.to_i > 5 ? "(p)urple":nil}".colorize(:magenta) +" and " + "(y)ellow".colorize(:yellow) + " Use (q)uit at any time to end the game."
		game_flow		
	end
	
	def game_flow
		@i = 0
		start_time
		create_player_guess
		process_code_and_player_guess
		while @results.positions_correct != secret_code.length
		  @i += 1
		  puts "'#{@player_guess.code.join}' has #{@results.colors_correct} of the correct elements with #{@results.positions_correct} in the correct positions."
		  puts "You've taken #{@i} #{@i = 1 ? "guess" : "guesses"}. Try again."
		  create_player_guess
		  @results = GuessCompare.new(player_guess.code, secret_code)
		end
		end_time
		time_difference
		messages.winning_message
    puts "Congratulations! You guessed the sequence '#{@secret_code.join}' in #{@i} guesses over about #{@time3.round / 60} minute#{@time3 < 30 ? nil : "s"}."		
    play_again_or_quit

	end

	def process_code_and_player_guess
		@results = GuessCompare.new(player_guess.code, secret_code)
	end

	def create_player_guess
	  puts "What's your guess?"
	  @input = gets.chomp
    @player_guess = Guess.new(@input, @difficulty)
    if player_guess.guess_too_long?
		   puts "Your guess is too long. Your guess should be #{@difficulty} characters long. Try again."
		   create_player_guess
		elsif player_guess.guess_too_short?
			 puts "Your guess is too short. Your guess should be #{@difficulty} characters long. Try again."
			 create_player_guess
		elsif player_guess.invalid_characters? 
		   puts "You've entered invalid characters. Try again."
		   create_player_guess
		else
		end	
	end


	def generate_code
		code = SequenceGenerator.new(@difficulty)
		@secret_code = code.secret_code
	end

	def start_time
	 	@time1 = Time.now	
	end

	def end_time
	  @time2 = Time.now  	
	end

	def time_difference
	  @time3 = @time2 - @time1  	
	end

	def play_again_or_quit
    puts "Do you want to (p)lay again or (q)uit?"
    entry = gets.chomp
    case entry
    when "p", "play"
      intro_message
    when 'q', "quit"
    end  	  	
	end
end

