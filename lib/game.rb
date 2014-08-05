require_relative 'sequence_generator'
require_relative 'guess'
require_relative 'guess_compare'
require_relative 'user_messages'
require_relative 'json_creator'
require 'colorize'

class Game
	attr_reader :difficulty, 
	:secret_code, 
	:player_guess, 
	:results, 
	:time1, 
	:messages,
	:time3,
	:name
	
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
			messages.guess_count(guess_counter)
			create_player_guess
			@results = GuessCompare.new(player_guess.code, secret_code)
		end

		end_time
		time_difference
		messages.winning_message
		@name = gets.strip
		@json = Scores.new(name, secret_code, guess_counter, time3).store_score		
		messages.session_time_message(secret_code, guess_counter, time3)
		messages.play_again_message
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
		when player_guess.quit? 
		   exit
		when player_guess.too_long?
			messages.guess_too_long(difficulty)
			create_player_guess
		when player_guess.too_short?
			messages.guess_too_short(difficulty)
			create_player_guess
		when player_guess.invalid_characters? 
			messages.guess_is_invalid
			create_player_guess
		end
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
		entry = gets.strip
		case
		when play?(entry)
			@mastermind = Mastermind.new.set_difficulty_and_start_game
		when quit?(entry)
			messages.quit_message
			exit
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



