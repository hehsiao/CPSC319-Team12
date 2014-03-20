class DashboardController < ApplicationController

	before_filter :authenticate_user!
 
	def index  
		@ideas = Idea.all  
		@recent_ideas = Idea.recent
		# Need to fix to make sure ideas gets updated from cache

		@sub_ideas = Subscription.where(user_id: current_user.id)    

		#@notifications = Notification.all
		@activities = PublicActivity::Activity.order("created_at desc")
	end

end
