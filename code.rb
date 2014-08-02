class Code
	attr_reader :difficulty       # => nil
	def initialize(difficulty=4)
	  @difficulty = difficulty    # => 4
	end

	def code_generator
		i     =  0                              # => 0
		@code =  []                             # => []
		while i < @difficulty                   # => true, true, true, true, false
		  random_color = Random.new             # => #<Random:0x000001010cdc10>, #<Random:0x000001010cd300>, #<Random:0x000001010cce50>, #<Random:0x000001010cc220>
			random_color = random_color.rand(100)  # => 54, 5, 49, 29
			case random_color                      # => 54, 5, 49, 29
			when  0..25
			 @code << "R"                          # => ["B", "R"]
				i += 1                                # => 2
			when 26..50
			 @code << "G"                          # => ["B", "R", "G"], ["B", "R", "G", "G"]
			  i += 1                               # => 3, 4
			when 51..75  	
		   @code << "B"                         # => ["B"]
		    i += 1                              # => 1
		  when 76..100
		   @code << "Y"
		    i += 1
			end                                    # => 1, 2, 3, 4
		end                                     # => nil
		@code                                   # => ["B", "R", "G", "G"]
	end	
end


code = Code.new      # => #<Code:0x000001010ce110 @difficulty=4>
code.code_generator  # => ["B", "R", "G", "G"]


