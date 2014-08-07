require_relative 'test_helper'
require_relative '../lib/user_messages'



class UserMessagesTest < Minitest::Test
	attr_reader :messages

	def setup
		@messages = UserMessages.new		
	end

	def test_puts_try_again_messages
		assert_output ("Try again.\n") {messages.try_again_message}
	end

	def test_puts_play_again_message
		assert_output ("Do you want to (p)lay again or (q)uit?\n") {messages.play_again_message}
	end

	def test_puts_invalid_input
		assert_output ("\nNot sure what you're trying to do buddy. Let's try this again.\n") {messages.invalid_input}
	end

  def test_puts_asks_for_guess
    assert_output ("What's your guess?\n") {messages.ask_for_guess}	
  end

  def test_puts_guess_is_invalid
    assert_output ("You've entered invalid characters. Try again.\n") {messages.guess_is_invalid}	
  end  

end