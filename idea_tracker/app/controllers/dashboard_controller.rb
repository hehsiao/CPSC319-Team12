class DashboardController < ApplicationController

	before_filter :authenticate_user!
 
	def index  
		@ideas = Idea.all  
		#@notifications = Notification.all
	end

end
