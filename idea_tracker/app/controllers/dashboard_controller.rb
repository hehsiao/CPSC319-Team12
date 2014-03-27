class DashboardController < ApplicationController
	before_action :check_user_permission
	
	def index  

		@ideas = Idea.all  
		@recent_ideas = Idea.order("created_at desc").limit(5)
		@my_ideas = Idea.where(user_id: current_user.id)
		# Need to fix to make sure ideas gets updated from cache

		@subscribed_ideas = Idea.joins(:participants).where("subscriptions.user_id = ?", 1)
		@sub_ideas = Subscription.where(user_id: current_user.id)  

		@comments = Commontator::Comment.all 
		@threads = Commontator::Thread.all
		@thread_ids = []
		@comment_ids =[]

		@my_ideas.each do |my_idea|
			@threads.each do |thread|
				if  my_idea.id == thread.commontable_id
					@thread_ids << thread
				end 
			end	
		end	
      
		@sub_ideas.each do |sub_idea|
			@threads.each do |thread|
				if  sub_idea.idea_id == thread.commontable_id 
				    @thread_ids << thread
                end 
            end	
		end
        
        @comments.each do |comment|
        	@thread_ids.each do |thread_id|
        		if comment.thread_id == thread_id.id
        		    @comment_ids << comment  
        		end    
            end
        end	 
		#@notifications = Notification.all
		@activities = PublicActivity::Activity.order("created_at desc")

		ideas_within_month = Idea.where(:created_at => Time.now-(60*60*24*30)..Time.now)
		@ideas_group_by_week = ideas_within_month.group_by { |m| m.created_at.beginning_of_week }
	
	end

end
