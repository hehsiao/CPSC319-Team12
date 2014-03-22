class ReportsController < ApplicationController
  def index
  end
  
  def success_rate
   @users = User.all
   @ideas = Idea.all
   @status_size = Status.all.size
  end
 
 def status
   @status = Status.all
   @ideas = Idea.all
 end
 
 def view_pending_ideas

	   ideas = Idea.all
	   final_status = Status.all.size
	   now = Time.now.to_date
	   filtered_ideas = Array.new
	   ideas.each do |idea|
		if idea.status < final_status
			diff = now - idea.submission_date
			#if diff > :idea_days_limit
			#	filtered_ideas << idea
			#end
		end
	   end
	   @ideas = filtered_ideas

 end
 
 def status_show
   @ideas = Idea.where(status: params[:id])
   @status = Status.find(params[:id])
   @all_status = Status.all
 end
 
 def status_pie
   @status = Status.all
   @ideas = Idea.all
 end
 
 def success_rate_show
	@ideas = Idea.where(user_id: params[:id])
	@user = User.find(params[:id])
	@all_status = Status.all
 end
 
 def popularity
	@categories = Category.where(parent_id: 0)
 end
 
 def popularity_show
	@category = Category.find(params[:id])
	@categories = Category.where(parent_id: params[:id])
 end
end 

