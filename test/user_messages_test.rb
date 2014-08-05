require_relative 'test_helper'
require_relative '../lib/user_messages'



class UserMessagesTest < Minitest::Test

	def test_puts_try_again_messages
		messages = UserMessages.new
		assert_equal "Try again.", messages.try_again_message
	end

end