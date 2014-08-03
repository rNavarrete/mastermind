require_relative 'test_helper'
require_relative '../lib/guess_compare'


class GuessCompareTest < Minitest::Test
  def test_removes_repeated_elements
 		guess   = ["y","y","y","y"]
  	code    = ["r","r","r","y"]

  	compare = GuessCompare.new(guess, code)

  	assert_equal "y", compare.guess_remove_doubles_and_to_string
  end


  def test_remove_code_repeated_elements
  	code    = ["y","r","r","y"]
		guess   = ["y", "b", "b", "g"]

		compare = GuessCompare.new(guess, code)

    assert_equal ["y", "r"], compare.remove_code_repeated_elements
  	
  end



  def test_detects_a_correct_answer
  	guess   = ["y","r","g","y"]
  	code    = ["y","r","g","y"]

  	compare = GuessCompare.new(guess, code)

  	assert_equal 4, compare.positions_correct
  end

  def test_detects_completley_wrong_guess
  	guess   = ["r","b","y","g"]
  	code    = ["y","r","g","y"]

  	compare = GuessCompare.new(guess, code)


  	assert_equal 0, compare.positions_correct
  end

  def test_colors_correct_4_correct
  	code    = ["r", "g", "b", "y"]
  	guess   = ["y", "b", "g", "r"]

  	compare = GuessCompare.new(guess, code)


  	assert_equal 4, compare.colors_correct
  end

  def test_colors_correct_none_correct
  	code    = ["r", "r", "r", "r"]
  	guess   = ["y", "b", "b", "g"]

  	compare = GuessCompare.new(guess, code)

  	assert_equal 0, compare.colors_correct
  end
end
