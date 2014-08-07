require_relative "test_helper"
require_relative "../lib/game"

class GameTest < Minitest::Test
	attr_reader :game
	

	def setup
	end

	def test_takes_an_argument
	  @game = Game.new(4)
	  assert_equal  4, game.difficulty 
	end

end	