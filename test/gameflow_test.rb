require_relative "test_helper"
require_relative "../lib/game"

class GameTest < Minitest::Test
	attr_reader :game
	def setup
	end

	def test_outputs_error_message_when_player_guess_too_short
	  @game = Game.new(4)
	  @player_guess = Guess.new("rrrr", 4)	
	  assert_equal  "Your guess is too long. Try again.", game.create_player_guess 	
	end

end	