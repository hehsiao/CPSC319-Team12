class DashboardController < ApplicationController

	before_filter :authenticate_user!
 
	def index  
		@ideas = Idea.all  
		@recent_ideas = Idea.recent
		#@notifications = Notification.all
	end

end
