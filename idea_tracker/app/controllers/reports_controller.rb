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
end
