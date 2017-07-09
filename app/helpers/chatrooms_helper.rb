module ChatroomsHelper
	def get_time(date)
		date.strftime("%H:%M:%S %p")
	end
end
