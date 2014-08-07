require 'json'  # => true

class	Scores
	attr_reader :name,                                       # => :name
	:secret_code,                                            # => :secret_code
	:guess_counter,                                          # => :guess_counter
	:time3                                                   # => nil
	
	def initialize(name, secret_code, guess_counter, time3)
		scores = []
		@name = name
		@secret_code = secret_code.join
		@guess_counter = guess_counter
		@time3 = time3.round / 60
	end

  def store_score

	  raw_score = {:name => name, :code => secret_code, :guess_counter => guess_counter.to_s, :time => time3.to_s}.to_json
	  contents = File.read("/Users/Home/Desktop/MasterMind/data/high_scores.json")
    
	  score = contents.insert(1, ",")
	  score = contents.insert(1, raw_score)
  

	  File.open("/Users/Home/Desktop/MasterMind/data/high_scores.json","w") do |f|
      f.write(score)
      f.close
    end
  end

  def retrieve_scores
  	file = File.read("/Users/Home/Desktop/MasterMind/data/high_scores.json")
  	data_hash = JSON.parse(file)
  	min_guesses = data_hash.sort_by {|x| x["guess_counter"].to_i}
  	min_guesses = min_guesses.map {|x| "#{x["name"].colorize(:blue)} solved #{x["code"]} in #{x["guess_counter"]} guesses #{x["time"].to_i < 1 ? "in under a minute." : "over about #{x["time"]} minutes."}"}
    min_guesses.take(10).each_with_index {|x, y| puts ".#{y+1} #{x}"}
    puts""
  end
end	



