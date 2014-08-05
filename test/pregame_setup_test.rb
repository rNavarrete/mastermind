require_relative 'test_helper'
require_relative '../lib/pregame_setup'

class MasterMindTest < Minitest::Test

	def test_it_exists
		master_mind = MasterMind.new
	end

	def test_it_quits_from_start_up_options_when_command_is_q
	end
end	