class ReportsController < ApplicationController
  def index
  end
  
  def success_rate
   @users = User.all
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
 end
 
 def status_pie
   @status = Status.all
   @ideas = Idea.all
 end
end
