require_relative 'game'  # => true

class MasterMind

	def start_up
		puts "Welcome to MASTERMIND Would you like to (p)lay, read the (i)nstructions, or (q)uit?"  # => nil
		command = ""                                                                                # => ""
		while command != "q"                                                                        # => true
			command = gets.chomp                                                                       # ~> NoMethodError: undefined method `chomp' for nil:NilClass
			case command
				when "play", "p"
						puts "Please enter a difficulty, (b)eginner, (i)ntermediate, (h)ard or (q)uit."
						difficulty = gets.chomp
						 case difficulty
						 when "b", "beginner"
						 	difficulty = 4
						 	Game.new(difficulty)
						 when "i", "intermediate"
						  difficulty = 5 	
						  Game.new(difficulty)
						 when "h", "hard"
						  difficulty = 6
						  Game.new(difficulty)
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



master_mind = MasterMind.new  # => #<MasterMind:0x000001010c52e0>
master_mind.start_up

# >> Hello
# >> Welcome to MASTERMIND Would you like to (p)lay, read the (i)nstructions, or (q)uit?

# ~> NoMethodError
# ~> undefined method `chomp' for nil:NilClass
# ~>
# ~> /Users/Home/Desktop/MasterMind/master_mind_introduction.rb:9:in `start_up'
# ~> /Users/Home/Desktop/MasterMind/master_mind_introduction.rb:57:in `<main>'
