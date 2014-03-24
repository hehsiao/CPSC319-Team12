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
 

 def pending_ideas
	
 end
 
 def pending_ideas_show
	@days = params[:submit]
	@ideas = Idea.where(:submission_date => Time.now-(60*60*24*365*100)..Time.now - (60*60*24*@days.to_i))
	@all_status = Status.all
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
	idea_counter = idea_counter_array
	category_children = Category.where(parent_id: params[:id])
	quicksort idea_counter, 0, nil, category_children
	
	@category = Category.find(params[:id])
	@idea_counter_array = idea_counter.reverse
	@category_children = category_children.reverse
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
 
def quicksort(array,from=0, to=nil, accompany_array)
    if to == nil
        # Sort the whole array, by default
        to = array.count - 1
    end
 
    if from >= to
        # Done sorting
        return
    end
 
    # Take a pivot value, at the far left
    pivot = array[from]
	accompany_pivot = accompany_array[from]
 
    # Min and Max pointers
    min = from
    max = to
 
    # Current free slot
    free = min
 
    while min < max
        if free == min # Evaluate array[max]
            if array[max] <= pivot # Smaller than pivot, must move
                array[free] = array[max]
				accompany_array[free] = accompany_array[max]
                min += 1
                free = max
            else
                max -= 1
            end
        elsif free == max # Evaluate array[min]
            if array[min] >= pivot # Bigger than pivot, must move
                array[free] = array[min]
				accompany_array[free] = accompany_array[min]
                max -= 1
                free = min
            else
                min += 1
            end
        else
            raise "Inconsistent state"
        end
    end
    array[free] = pivot
	accompany_array[free] = accompany_pivot
 
    quicksort array, from, free - 1,accompany_array
    quicksort array, free + 1, to,accompany_array
end	
 
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

