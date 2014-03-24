class Setting < ActiveRecord::Base

	def self.allow_sign_up
		self.find_by_name("Allow Sign Up").data.casecmp "yes" == 0
	end

	def self.default_owner
		self.find_by_name("Default Owner").data.to_i
	end
end
