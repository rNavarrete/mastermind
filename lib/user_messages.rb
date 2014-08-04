require 'colorize'
class UserMessages

	def instructions                 
	  puts ""	
	  puts "The computer will create a random four-six letter code. The computer chooses a pattern of four to six color sequences according to the chosen difficulty. Duplicates are allowed, so the player could even choose four letters of the same color."
	  puts "The chosen pattern is placed in the four holes covered by the shield, visible to the codemaker but not to the codebreaker."
	  puts ""
	end

  def welcome_message
  	puts ""	
		puts "Welcome to MasterMind".colorize(:green)
		puts "Would you like to" +"(p)".colorize(:green)+"lay read the "+"(i)".colorize(:green)+"nstructions, or "+"(q)".colorize(:green)+"uit?"
  end

  def quit_message
  	puts ""	
		puts "Thanks for playing Master Mind!"
		puts ""
  end

  def invalid_input
    puts ""
		puts "Not sure what you're trying to do buddy."
		puts "Let's try this again." 
		puts "" 	
  end

  def set_difficulty_message
    puts""
  	puts "Please enter a difficulty,"+" (b)".colorize(:green) +"eginner, "+"(i)".colorize(:green)+"ntermediate, "+"(h)".colorize(:green)+"ard or "+"(q)".colorize(:green)+"uit."
  end

  def winning_message
 	  puts "" 
    puts "Hey you got it! You're a true MasterMind."	
  end
end