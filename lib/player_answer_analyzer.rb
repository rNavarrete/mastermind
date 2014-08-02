

# what is your answer?

# player answers a four sequence string


# cpu stores that answer


# cpu takes that string splits it into another array and then begins a series of questions

# 1) Does the players answer have any of the correct colors in the correct positions?


code = ["y","r","y","y"]  # => ["y", "r", "y", "y"]

guess = ["r", "r", "r", "r"]  # => ["r", "r", "r", "r"]

correct_positions = 0  # => 0

correct_positions  # => 0

code.zip(guess)  # => [["y", "r"], ["r", "r"], ["y", "r"], ["y", "r"]]


matching_spaces = code.zip(guess).collect {|x, y| x == y }  # => [false, true, false, false]

matching_spaces                                                                               # => [false, true, false, false]
number_of_correct_in_correct_place = matching_spaces.find_all {|match| match == true}.length  # => 1





# I need to figure out the logic for correct number of colors, so how do I think of it?