require_relative 'test_helper'
require_relative 'master_mind_introduction'

class IntegrationTest < Minitest::Test
	
	def test_puts_opening_message
		master_mind = MasterMind.new
    assert_equal 'Welcome to MASTERMIND Would you like to (p)lay, read the (i)nstructions, or (q)uit?', master_mind.start_up
	end

	def test_asks_for_a_guess
		master_mind = MasterMind.new
	end	
end
