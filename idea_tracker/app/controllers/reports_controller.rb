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
   @days
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
end
