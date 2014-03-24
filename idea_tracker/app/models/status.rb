class Status < ActiveRecord::Base

	def to_s
		self.status
	end
	
end
