gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'master_mind_introduction'

class IntegrationTest < Minitest::Test

	def test_puts_opening_message
		master_mind = Mastermind.new
		assert_equal "Welcome to MASTERMIND/n Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
	end	
end
