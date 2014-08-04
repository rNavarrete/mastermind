require_relative 'game'

class MasterMind
	attr_reader :messages, :difficulty, :command
  
  def initialize
  	@messages = UserMessages.new
  end

	
	def start_up_options
		while command != "q"
			messages.welcome_message
			@command = gets.chomp		
			case command
			when "play", "p"
			  set_difficulty_and_start_game	
			  break  
			when 'i', "instructions"
			  messages.instructions
			  command = ""
			when "q", "quit"
			  break
			else
			  messages.invalid_input
			end
		end
		messages.quit_message
	end

	def start_game
    game = Game.new(difficulty)
    game.intro_message		
	end

  def set_difficulty_and_start_game
    messages.set_difficulty_message
 		 difficulty = gets.chomp
		 case difficulty
		 when "b", "beginner"
		 	@difficulty = 4
		 when "i", "intermediate"
		  @difficulty = 6 	
		 when "h", "hard"
		  @difficulty = 8
		 else
		  puts "Try again."
		  start_up_options  
		 end
		start_game  
  end
end	

game = MasterMind.new
game.start_up_options
