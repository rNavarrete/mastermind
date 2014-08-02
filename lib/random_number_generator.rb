class CodeGenerator

	def code_generator(difficulty=4)
		challenge_level =  difficulty           # => 4
		i               =  0                    # => 0
		@code            =  []                  # => []
		while i < challenge_level               # => true, true, true, true, false
			random_color = Random.new              # => #<Random:0x0000010185a000>, #<Random:0x000001018598d0>, #<Random:0x00000101859218>, #<Random:0x00000101858ea8>
			random_color = random_color.rand(100)  # => 33, 12, 40, 0

			case random_color  # => 33, 12, 40, 0
			when  0..25
			 @code << "R"      # => ["G", "R"], ["G", "R", "G", "R"]
				i += 1            # => 2, 4
			when 26..50
			 @code << "G"      # => ["G"], ["G", "R", "G"]
			  i += 1           # => 1, 3
			when 51..75  	
		   @code << "B"
		    i += 1
		  when 76..100
		   @code << "Y"
		    i += 1
			end                # => 1, 2, 3, 4
		end                 # => nil
		@code               # => ["G", "R", "G", "R"]
	end
end


code = CodeGenerator.new  # => #<CodeGenerator:0x0000010185a578>

code.code_generator  # => ["G", "R", "G", "R"]








