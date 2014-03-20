class DashboardController < ApplicationController

	before_filter :authenticate_user!
 
	def index  
		@ideas = Idea.all  
		@recent_ideas = Idea.recent
		# Need to fix to make sure ideas gets updated from cache

		#@notifications = Notification.all
	end

end
