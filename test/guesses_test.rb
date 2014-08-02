gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guesses'


class GuessesTest < Minitest::Test

	def test_returns_an_array
		input = "rgby" 
    guess = Guesses.new(input)

    assert_equal ['r', 'g', 'b', 'y'], guess.guess
  end

  def test_returns_a_downcased_array
		input = "RGBY" 
    guess = Guesses.new(input)

    assert_equal ['r', 'g', 'b', 'y'], guess.guess  
  end

  def test_returns_correct_number_of_elements
  	input = "yyyY"
  	guess = Guesses.new(input)

  	assert_equal 4, guess.count
  end

  def test_returns_guess_back_as_string
  	input = "rbBR"
  	guess = Guesses.new(input)

  	assert_equal "rbbr", guess.guess_as_string
  end
end	