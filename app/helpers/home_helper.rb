module HomeHelper

	def seven_days_ago_in_unix_time 
		now = DateTime.now.to_time.to_i
		seven_days_ago = now - 604,800
	end 

end
