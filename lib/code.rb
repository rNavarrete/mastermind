class SequenceGenerator
	attr_reader :difficulty  # => nil

	def difficulty
		@difficulty
	end

	def initialize(difficulty=4)
	  @difficulty = difficulty    # => 4
	end

	def code_generator
		i     = 0                               # => 0
		@code = []                              # => []
		while i < @difficulty                   # => true, true, true, true, false
		  random_color = Random.new             # => #<Random:0x000001010cd7b0>, #<Random:0x000001010ccf68>, #<Random:0x000001010cc4f0>, #<Random:0x000001010cc950>
			random_color = random_color.rand(100)  # => 31, 20, 88, 9
			case random_color                      # => 31, 20, 88, 9
			when  0..25
			 @code << "r"                          # => ["g", "r"], ["g", "r", "y", "r"]
				i += 1                                # => 2, 4
			when 26..50
			 @code << "g"                          # => ["g"]
			  i += 1                               # => 1
			when 51..75  	
		   @code << "b"
		    i += 1
		  when 76..100
		   @code << "y"                         # => ["g", "r", "y"]
		    i += 1                              # => 3
			end                                    # => 1, 2, 3, 4
		end                                     # => nil
		@code                                   # => ["g", "r", "y", "r"]
	end	
end

