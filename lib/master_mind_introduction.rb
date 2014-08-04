require_relative 'game'

class MasterMind
	attr_reader :difficulty, :command
	
	def start_up_options
		welcome_message
		while command != "q"
			case command
			when "play", "p"
			  set_difficulty_and_start_game	
			  break  
			when 'i', "instructions"
			  instructions
			when "q", "quit"
			  break
			else
			  invalid_input
			end
		end
		quit_message
	end

	def start_game
    game = Game.new(difficulty)
    game.intro_message		
	end

	def instructions
	  puts ""	
	  puts "The computer will create a random four-six letter code. The computer chooses a pattern of four to six color sequences according to the chosen difficulty. Duplicates are allowed, so the player could even choose four letters of the same color."
	  puts "The chosen pattern is placed in the four holes covered by the shield, visible to the codemaker but not to the codebreaker."
	  puts ""
	  start_up_options
	end

  def welcome_message
  	puts ""	
		puts "Welcome to MASTERMIND" 
		puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
		@command = gets.chomp
  end

  def quit_message
  	puts ""	
		puts "Thanks for trying out Master Mind."
		puts ""
  end

  def invalid_input
    puts ""
		puts "Not sure what you're trying to do buddy."
		puts "Let's try this again." 
		puts "" 	
  end

  def set_difficulty_and_start_game
		puts "Please enter a difficulty, (b)eginner, (i)ntermediate, (h)ard or (q)uit."		
		difficulty = gets.chomp
		 case difficulty
		 when "b", "beginner"
		 	@difficulty = 4
		 when "i", "intermediate"
		  @difficulty = 5 	
		 when "h", "hard"
		  @difficulty = 6
		 else
		  puts "Try again."
		  start_up_options  
		 end
		start_game  
  end
end	

game = MasterMind.new
game.start_up_options
