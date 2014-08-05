require 'json'

class	Scores
	attr_reader :name, 
	:secret_code, 
	:guess_counter, 
	:time3
	
	def initialize(name, secret_code, guess_counter, time3)
		scores = []
		@name = name
		@secret_code = secret_code.join
		@guess_counter = guess_counter
		@time3 = time3
	end

  def store_score
	  score = {
	  	:name => name, 
	  	:code => secret_code, 
	  	:guesses => guess_counter,
	  	:time3 => time3
	  }

	  File.open("data/high_scores.json","a+") do |f|
    f.write(score.to_json)
    f.close
    end
  end

  def retrieve_scores
  	scores = JSON.parse(File.read("data/high_scores.json"));
 		sections = topObject ["sections"]
		sections.each do |section|
      section_id = section["section_id"]      
      events     = section["events"]
      events.each do |event|
        event_id = event["event_id"]
        event_name = event["event_name"]
      end
    end
  end
end	