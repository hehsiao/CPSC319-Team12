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
 
 def success_rate_column_chart
	@users = User.all
	@ideas = Idea.all
	@status_size = Status.all.size
 end
 
 def popularity
	@categories = Category.where(parent_id: 0)
 end
 

 # TODO : Sort by idea_counter_array
 def popularity_show
	@category = Category.find(params[:id])
	@idea_counter_array = idea_counter_array
	@category_children = Category.where(parent_id: params[:id])
 end
 
 def popularity_show_ideas
	category_child = Category.find(params[:id])
	ideaTags = IdeaTag.where(category_id: category_child.id)
	idea_ids = Array.new
	ideaTags.each do |idea_tag|
		idea_ids << idea_tag.idea_id
	end	
	
	ideas = Idea.all
	filtered_ideas = Array.new
	ideas.each do |idea|
		if idea_ids.include?(idea.id)
			filtered_ideas << idea
		end
	end	
	@ideas = filtered_ideas
	@category_child = category_child
	@all_status = Status.all
 end
 
 def popularity_pie
	#@idea_counter_array = idea_counter_array
	#@category_children = Category.where(parent_id: params[:id])
 end
 
 private 
 # TODO : There must be a simpler way 
 def idea_counter_array
	category_children = Category.where(parent_id: params[:id])
	
	# get all the idea_tags where the category_id == any of category_child.id
	idea_tags = Array.new
	category_children.each do |category_child|
		tags = IdeaTag.where(category_id: category_child.id)
		idea_tags.concat(tags)
	end
	
	# count the number of idea tags associated with each category children
	idea_counter_array = Array.new
	category_children.each do |category_child|
		counter = 0
		idea_tags.each do |idea_tag|
			if idea_tag.category_id == category_child.id
				counter += 1
			end
		end
		idea_counter_array << counter
	end
	return idea_counter_array
 end
	
end 

