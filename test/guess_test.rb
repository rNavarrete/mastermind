require_relative 'test_helper'
require_relative '../lib/guess'

class GuessTest < Minitest::Test
  attr_reader :guess, :upcase_guess, :invalid_guess
  
  def setup
    @guess = Guess.new("rgby")
    @invalid_guess = Guess.new("$X679>") 
  end

	def test_returns_an_array
    assert_equal ['R', 'G', 'B', 'Y'], guess.code
  end


  def test_returns_correct_number_of_elements
  	assert_equal 4, guess.count
  end

  def test_guess_with_invalid_characters
    refute false, invalid_guess.invalid_characters? 
  end
end	