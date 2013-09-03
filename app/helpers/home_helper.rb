module HomeHelper

	def get_seven_days_ago_in_unix_time 
		now = DateTime.now.to_time.to_i
		seven_days_ago = now - 583200 #approximately seven days in unix time
		seven_days_ago
	end

	# def break_hash_tags
	# 	@photos
	# end 

	def initialize_foursquare_client
		client = Foursquare2::Client.new(
		:client_id => "ZRGZQTQQLBZT0PGFL3H0M55LXXJT10CIOWELT0IVSU1BO4TQ", 
		:client_secret => "0NZM1ZTO4OKARLYLJ5SRIZVPQRNOZJNJH2KWZIVHIM1OYNQJ"
		)
		client
	end 

end
