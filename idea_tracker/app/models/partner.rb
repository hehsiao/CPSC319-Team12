class Partner < ActiveRecord::Base
	has_many :ideas
	
	validates :partner_name, :presence => true,
					  :length => { :maximum => 100 }					  
	validates :contact_name, :presence => true,
					  :length => { :maximum => 100 }						  
	validates :email, :presence => true,
					  :length => { :maximum => 100 },
                      :confirmation => true

	def to_s
		self.partner_name
	end
	
end
