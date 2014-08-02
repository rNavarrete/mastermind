require_relative 'player_interaction'

class MasterMind

	def start_up
		puts "Welcome to MASTERMIND" 
		puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
		command = ""
		while command != "q"
			command = gets.chomp
			case command
				when "play", "p"
						puts "Please enter a difficulty, (b)eginner, (i)ntermediate, (h)ard or (q)uit."
						difficulty = gets.chomp
						 case difficulty
						 when "b", "beginner"
						 	difficulty = 4
						 	game = GameFlow.new(difficulty)
						 	game.intro_quote
						 when "i", "intermediate"
						  difficulty = 5 	
						  game = GameFlow.new(difficulty)
						  game.intro_quote
						 when "h", "hard"
						  difficulty = 6
						  game = GameFlow.new(difficulty)
						  game.intro_quote
						 else
						   puts "Try again."
						   start_up  
						 end 
			  when 'i', "instructions"
				  instructions
			  when "q", "quit"
				  break
			  else
			  	puts ""
				  puts "Not sure what you're trying to do buddy."
				  intro_message
			end
		end
		puts ""	
		puts "Thanks for trying out Master Mind."
		puts ""
	end

	def instructions
	puts ""	
	puts "The computer will create a random four letter code. The codemaker chooses a pattern of four code pegs. Duplicates are allowed, so the player could even choose four code pegs of the same color. The chosen pattern is placed in the four holes covered by the shield, visible to the codemaker but not to the codebreaker."
	puts ""
	start_up
	end
end	

game = MasterMind.new
game.start_up
