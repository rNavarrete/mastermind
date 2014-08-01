class MasterMind

	def start_up
		puts 'Welcome to MASTERMIND Would you like to (p)lay, read the (i)nstructions, or (q)uit?'
		command = ""
		while command != 'q'
			command = gets.chomp
			case command
			  when 'p'
			  	puts ""
				  puts "hi"
				  puts ""
				when 'play'
				  puts "Flaco"  
			  when 'i'
				  instructions
				when 'instructions'
					instructions   
			  when 'q'
				  break
				when "quit"
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



master_mind = MasterMind.new
master_mind.start_up
