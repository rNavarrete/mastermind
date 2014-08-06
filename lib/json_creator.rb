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
  	file = File.read("/Users/Home/Desktop/MasterMind/data/high_scores.json")                                                            # => "[{\"name\":\"Rolando\",\"code\":\"BYBR\",\"guess_counter\":\"5\",\"time\":\"0.3440624666666666\"},{\"name\":\"Robbie\",\"code\":\"GYRB\",\"guess_counter\":\"2\",\"time\":\"2\"}]"
  	data_hash = JSON.parse(file)                                                                                                        # => [{"name"=>"Rolando", "code"=>"BYBR", "guess_counter"=>"5", "time"=>"0.3440624666666666"}, {"name"=>"Robbie", "code"=>"GYRB", "guess_counter"=>"2", "time"=>"2"}]
  	min_guesses = data_hash.sort_by {|x| x["guess_counter"].to_i}                                                                       # => [{"name"=>"Robbie", "code"=>"GYRB", "guess_counter"=>"2", "time"=>"2"}, {"name"=>"Rolando", "code"=>"BYBR", "guess_counter"=>"5", "time"=>"0.3440624666666666"}]
  	min_guesses = min_guesses.map {|x| "#{x["name"]} solved #{x["code"]} in #{x["guess_counter"]} guesses over #{x["time"]} minutes."}  # => ["Robbie solved GYRB in 2 guesses over 2 minutes.", "Rolando solved BYBR in 5 guesses over 0.3440624666666666 minutes."]
    puts min_guesses                                                                                                                   # => nil
  end
end	

json = Scores.new("Robbie", ["G", "Y", "R", "B"], 2, 131)  # => #<Scores:0x000001011b0e20 @name="Robbie", @secret_code="GYRB", @guess_counter=2, @time3=2>
json.retrieve_scores                                       # => nil



# >> Robbie solved GYRB in 2 guesses over 2 minutes.
# >> Rolando solved BYBR in 5 guesses over 0.3440624666666666 minutes.
