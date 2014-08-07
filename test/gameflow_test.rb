require_relative "test_helper"
require_relative "../lib/game"

class GameTest < Minitest::Test
	attr_reader :game

	def test_takes_in_a_default_difficulty_value
	 @game = Game.new
	 assert_equal 4, game.difficulty
	end

	def test_takes_in_a_different_difficulty_value
	  @game = Game.new(8)
	  assert_equal  8, game.difficulty 
	end

	def test_generates_a_default_four_element_sequence_secret_code
		@game = Game.new
		assert_equal 4, game.secret_code.length
	end

	def test_generates_a_6_element_secret_code_when_difficulty_is_6
		@game = Game.new(6)
		assert_equal 6, game.secret_code.length
	end

	def test_generates_a_8_element_secret_code_when_difficulty_is_8
		@game = Game.new(8)
		assert_equal 8, game.secret_code.length
	end
end	