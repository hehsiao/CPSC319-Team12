class DashboardController < ApplicationController

	before_filter :authenticate_user!
 
	def index  
		@ideas = Idea.all
		@sub_ideas = Subscription.where(user_id: current_user.id)    
		#@notifications = Notification.all
		@activities = PublicActivity::Activity.order("created_at desc")
		@recent_ideas = Idea.recent
	end

end
