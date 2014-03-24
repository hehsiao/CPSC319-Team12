class Setting < ActiveRecord::Base

	def self.default_owner
		self.where(:name => 'Default Owner').first.data.to_i
	end
end
