require_relative 'game'
require "pry"

class MasterMind
	attr_reader :messages, :difficulty, :command

	def initialize
		@messages = UserMessages.new
	end

	def start_up_options
		until quit?
			messages.welcome_message
			@command = gets.strip		
			case
			when play?
				set_difficulty_and_start_game	
			when instructions?
				messages.instructions
			when quit?
				messages.quit_message
			else
				messages.invalid_input
			end
		end
	end

	def start_game
		Game.new(difficulty).start_game
	end

	def set_difficulty_and_start_game
		messages.set_difficulty_message
		@difficulty = gets.strip
		case
		when beginner?
			@difficulty = 4
		when intermediate?
			@difficulty = 6
		when hard?
			@difficulty = 8
		else
			puts "Try again."
			set_difficulty_and_start_game
		end
		start_game
	end

	private

	def beginner?
		difficulty == "b" || difficulty == "beginner"
	end

	def intermediate?
		difficulty == "i" || difficulty == "intermediate"
	end

	def hard?
		difficulty == "h" || difficulty == "hard"
	end

	def play?
		command == "play" || command == "p"
	end

	def instructions?
		command == "i" || command == "instructions"
	end

	def quit?
		command == "q" || command == "quit"
	end
end


game = MasterMind.new
game.start_up_options