class DashboardController < ApplicationController

	before_filter :authenticate_user!
	
	def index  
		@ideas = Idea.all  
		@recent_ideas = Idea.order("submission_date desc").limit(5)
		@my_ideas = Idea.where(user_id: current_user.id)
		# Need to fix to make sure ideas gets updated from cache

		@subscribed_ideas = Idea.joins(:participants).where("subscriptions.user_id = ?", 1)
		@sub_ideas = Subscription.where(user_id: current_user.id)   


		#@notifications = Notification.all
		@activities = PublicActivity::Activity.order("created_at desc")
	end

end
