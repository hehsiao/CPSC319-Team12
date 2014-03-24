class Status < ActiveRecord::Base

	validates_presence_of :status

	def to_s
		self.status
	end
	
end
