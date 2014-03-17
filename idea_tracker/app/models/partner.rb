class Partner < ActiveRecord::Base
	has_many :ideas
	
	validates_presence_of :partner_name
	validates_presence_of :contact_name
	validates_presence_of :email
end
