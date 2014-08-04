require_relative 'test_helper'
require_relative '../lib/guess'

class GuessTest < Minitest::Test
  attr_reader :guess, :upcase_guess, :invalid_guess
  
  def setup
    @guess = Guess.new("rgby")
    @upcase_guess = Guess.new("RGBY")
    @invalid_guess = Guess.new("$X679>") 
  end

	def test_returns_an_array
    assert_equal ['r', 'g', 'b', 'y'], guess.code
  end

  def test_returns_a_downcased_array 
    assert_equal ['r', 'g', 'b', 'y'], upcase_guess.code  
  end

  def test_returns_correct_number_of_elements
  	assert_equal 4, guess.count
  end

  def test_returns_guess_back_as_string
  	assert_equal "rgby", guess.guess_as_string
  end

  def test_guess_with_invalid_characters
    refute false, invalid_guess.valid_characters? 
  end

  def test_guess_with_invalid_length
    refute false, invalid_guess.valid_length?
  end

  def test_valid_method_detects_invalid_guesses
    refute false, invalid_guess.valid?
  end
end	