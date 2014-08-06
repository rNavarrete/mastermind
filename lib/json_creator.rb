require 'json'  # => true

class	Scores
	attr_reader :name,                                       # => :name
	:secret_code,                                            # => :secret_code
	:guess_counter,                                          # => :guess_counter
	:time3                                                   # => nil
	
	def initialize(name, secret_code, guess_counter, time3)
		scores = []                                             # => []
		@name = name                                            # => "Robbie"
		@secret_code = secret_code.join                         # => "GYRB"
		@guess_counter = guess_counter                          # => 2
		@time3 = time3.round / 60                               # => 2
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
  	file = File.read("/Users/Home/Desktop/MasterMind/data/high_scores.json")  # => "[{\"name\":\"Tony Montana\",\"code\":\"BRRB\",\"guess_counter\":\"6\",\"time\":\"0\"},{\"name\":\"Rolando\",\"code\":\"BYBR\",\"guess_counter\":\"5\",\"time\":\"0.3440624666666666\"},{\"name\":\"Robbie\",\"code\":\"GYRB\",\"guess_counter\":\"2\",\"time\":\"2\"}]"
  	data_hash = JSON.parse(file)                                              # => [{"name"=>"Tony Montana", "code"=>"BRRB", "guess_counter"=>"6", "time"=>"0"}, {"name"=>"Rolando", "code"=>"BYBR", "guess_counter"=>"5", "time"=>"0.3440624666666666"}, {"name"=>"Robbie", "code"=>"GYRB", "guess_counter"=>"2", "time"=>"2"}]
  	min_guesses = data_hash.sort_by {|x| x["guess_counter"].to_i}             # => [{"name"=>"Robbie", "code"=>"GYRB", "guess_counter"=>"2", "time"=>"2"}, {"name"=>"Rolando", "code"=>"BYBR", "guess_counter"=>"5", "time"=>"0.3440624666666666"}, {"name"=>"Tony Montana", "code"=>"BRRB", "guess_counter"=>"6", "time"=>"0"}]
  	

  	min_guesses = min_guesses.map {|x| "#{x["name"]} solved #{x["code"]} in #{x["guess_counter"]} guesses #{x["time"].to_i < 1 ? "in under a minute." : "over about #{x["time"]} minutes."}"}  # => ["Robbie solved GYRB in 2 guesses over about 2 minutes.", "Rolando solved BYBR in 5 guesses in under a minute.", "Tony Montana solved BRRB in 6 guesses in under a minute."]
    min_guesses.each_with_index {|x, y| puts ".#{y+1} #{x}"}
    puts""                                                                                                                                  # => ["Robbie solved GYRB in 2 guesses over about 2 minutes.", "Rolando solved BYBR in 5 guesses in under a minute.", "Tony Montana solved BRRB in 6 guesses in under a minute."]
  end
end	



