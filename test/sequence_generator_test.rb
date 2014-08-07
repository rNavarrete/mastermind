require_relative 'test_helper'
require_relative '../lib/sequence_generator'

class SequenceGeneratorTest < Minitest::Test
	attr_reader :sequence, :intermediate_sequence, :hard_sequence

	def setup
		@sequence = SequenceGenerator.new(4)
		@intermediate_sequence = SequenceGenerator.new(6)
		@hard_sequence = SequenceGenerator.new(8)

	end

	def test_it_stores_the_correct_difficulty_attribute
		assert_equal 4, sequence.difficulty
		assert_equal 6, intermediate_sequence.difficulty
		assert_equal 8, hard_sequence.difficulty
	end

	def test_it_returns_a_sequence_of_appropriate_length
    assert_equal 4, sequence.secret_code.length
		assert_equal 6, intermediate_sequence.secret_code.length
		assert_equal 8, hard_sequence.secret_code.length
	end
end 