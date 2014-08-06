require 'colorize'

class UserMessages
	def instructions                 
	  puts ""	
	  puts "The computer will create a random 4 to 8 letter sequence, the letters represent different colors. Your challenge is to guess the correct sequence of letters, keep in mind the colors can be repeated. Have fun."  
	  puts "The chosen pattern is placed in the four holes covered by the shield, visible to the codemaker but not to the codebreaker."
	  puts ""
    puts "Would you like to #{"(p)".colorize(:magenta)}lay, read the #{"(i)".colorize(:light_blue)}nstructions, or #{"(q)".colorize(:red)}uit?"    
	end

  def try_again_message
    puts "Try again."
  end

  def play_again_message
    puts "Do you want to (p)lay again or (q)uit?"    
  end

  def welcome_message
  	puts ""	
		
puts "


███╗   ███╗ █████╗ ███████╗████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗██████╗ 
████╗ ████║██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗
██╔████╔██║███████║███████╗   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║██║  ██║
██║╚██╔╝██║██╔══██║╚════██║   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██║  ██║
██║ ╚═╝ ██║██║  ██║███████║   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██████╔╝
╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝ 
                                                                                    

".colorize(:red).colorize(:blink)


      



		puts "Would you like to #{"(p)".colorize(:magenta)}lay, read the #{"(i)".colorize(:light_blue)}nstructions, or #{"(q)".colorize(:red)}uit?"
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
    puts ""
  	puts "Please enter a difficulty,#{"(b)".colorize(:green)}eginner, #{"(i)".colorize(:green)}ntermediate, #{"(h)".colorize(:green)}ard or #{"(q)".colorize(:green)}uit."
  end

  def winning_message
 	  puts "" 
    puts "Congratulations! You've guessed the sequence! You're a true MasterMind."
    puts "What's your name?".colorize(:blink).colorize(:red)	
  end

  def game_intro(difficulty)
    puts ""
    puts "I have generated a sequence with #{difficulty} elements made up of:#{difficulty == 8 ? '(o)range'.colorize(:light_red) : nil} #{"(r)ed".colorize(:red)}"
    puts "#{"(g)reen".colorize(:green)}, #{"(b)lue".colorize(:blue)},#{difficulty.to_i > 5 ? "(p)urple".colorize(:magenta) : nil} #{"(y)ellow".colorize(:yellow)}. Use (q)uit at any time to end the game."
  end

  def ask_for_guess
    puts "What's your guess?"
  end

  def session_time_message(secret_code, guess_counter, time3, name)
    puts "#{name}, you guessed the sequence! '#{secret_code.join}' in #{guess_counter} guesses #{time3.round / 60 < 1 ? "in under a minute, nice!" : "over about #{time3.round / 60} minute#{time3 <= 1 ? nil : "s"}."}"
    puts ""
    puts "=== TOP 10 ==="         
  end

  def guess_too_long(difficulty)
    puts "Your guess is too long. Your guess should be #{difficulty} characters long. Try again."
  end

  def guess_too_short(difficulty)
    puts "Your guess is too short. Your guess should be #{difficulty} characters long. Try again."
  end

  def guess_is_invalid
    puts "You've entered invalid characters. Try again."
  end

  def guess_assessment(player_guess, results)
    puts "'#{player_guess.code.join}' has #{results.colors_correct} of the correct elements with #{results.positions_correct} in the correct positions."
  end

  def guess_count(guess_counter)
    puts "You've taken #{guess_counter} #{guess_counter == 1 ? "guess" : "guesses"}. Try again."
  end
end
