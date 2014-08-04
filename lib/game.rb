require_relative 'sequence_generator'
require_relative 'guess'
require_relative 'guess_compare'
require_relative 'user_messages'
require 'colorize'

class Game
	attr_reader :difficulty, 
							:secret_code, 
							:player_guess, 
							:results, 
							:time1, 
							:messages
	
	attr_accessor :guess_counter
	
	def initialize(difficulty=4)
		@difficulty  = difficulty
		@secret_code = generate_code
		@messages    = UserMessages.new
	end
	
	def start_game
		messages.game_intro(difficulty)
		start_time
		create_player_guess
		process_code_and_player_guess
		@guess_counter = 0

		until win?
			@guess_counter += 1
			messages.guess_assessment(player_guess, results)
			messages.guess_count
			create_player_guess
			@results = GuessCompare.new(player_guess.code, secret_code)
		end

		end_time
		time_difference
		messages.winning_message
		puts "Congratulations! You guessed the sequence '#{@secret_code.join}' in #{guess_counter} guesses #{@time3.round / 60 < 1 ? "in under a minute, nice!" : "over about #{@time3.round / 60} minute#{@time3 > 1 ? nil : "s"}."}"     		
		play_again_or_quit
	end

	def process_code_and_player_guess
		@results = GuessCompare.new(player_guess.code, secret_code)
	end

	def create_player_guess
		messages.ask_for_guess
		@input = gets.strip
		@player_guess = Guess.new(@input, @difficulty)
		
		case
		when player_guess.too_long?
			messages.guess_too_long(difficulty)
		when player_guess.too_short?
			messages.guess_too_short(difficulty)
		when player_guess.invalid_characters? 
			messages.guess_is_invalid
		end
		create_player_guess
	end

	def generate_code
		SequenceGenerator.new(@difficulty).secret_code
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
		case
		when play?(entry)
			start_game
		when quit?(entry)
		end  	  	
	end

	def win?
		@results.positions_correct == secret_code.length
	end

	def play?(entry)
		entry == "p" || entry == "play"
	end

	def quit?(entry)
		entry == "q" || entry == "quit"
	end
end



