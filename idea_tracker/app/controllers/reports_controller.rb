class ReportsController < ApplicationController
  before_action :check_user_permission

  def index
  end
  
  def success_rate
   @users = User.all
   status_size = Status.all.size
   final_status = Status.where(position: status_size)
   final_status_id = final_status.at(0).id
   
   @success_rate_array = Array.new
   @users.each do |user|
	ideas = Idea.where(user_id: user.id)
	owner_of = ideas.size
	verified = 0
	ideas.each do |idea|
		if idea.status_id == final_status_id
			verified += 1
		end
	end
	
	if verified == 0
		@success_rate_array << 0
	else
		rate = verified*100/owner_of
		@success_rate_array << rate
	end
   end 
  end
 
 def status
	@status = Status.all
	ideas = Idea.all
	@counter_array = Array.new
	@status.each do |status|
		ideas = Idea.where(status_id: status.id)
		@counter_array << ideas.size
	end
 end

 def freshness
 	@ndays = params[:ndays]
 	@check_status = params[:status_list]
 	@check_status = Status.where.not(:status => ['Removed', 'Archived']).pluck(:id).map(&:to_s) if !(test_exist @check_status)
 	sql = 
 		((test_exist @ndays) ? "SELECT * FROM ( " : "") +
 		"SELECT i.id, GREATEST(i.updated_at, IFNULL(c.dt, i.created_at)) as latest_activity, " +
 		"i.updated_at as latest_idea_update, c.dt as latest_comment, i.created_at as idea_create " +
 		"FROM ideas as i " +
 		"LEFT JOIN ( " +
 			"SELECT commontable_id as id, MAX(cc.created_at) as dt " +
 			"FROM commontator_threads as ct " +
 			"JOIN commontator_comments as cc " +
 			"ON ct.id = cc.thread_id " +
 			"GROUP BY commontable_id " +
 		") c ON i.id = c.id " +
		((test_exist @check_status) ? ("WHERE " + (@check_status.collect{|u| "i.status_id=#{u} "}.join 'OR ')) : "" ) +
		"ORDER BY latest_activity ASC, latest_idea_update ASC, latest_comment ASC" +
		((test_exist @ndays) ? ") r WHERE latest_activity < DATE_SUB(curdate(), INTERVAL #{(@ndays.to_i - 1)} DAY) " : "")
	@result = ActiveRecord::Base.connection.execute(sql).to_a
	@sql = sql

 end

 def activity
 	if (test_exist params[:date_value1]) and !(test_exist params[:date_value2])
 		theDate = "WHERE created_at > '#{params[:date_value1]}' "
 	elsif !(test_exist params[:date_value1]) and (test_exist params[:date_value2])
 		theDate = "WHERE created_at < '#{params[:date_value2]}' "
 	elsif (test_exist params[:date_value1]) and (test_exist params[:date_value2])
 		theDate = "WHERE created_at BETWEEN '#{params[:date_value1]}' AND '#{params[:date_value2]}' "
 	else
 		theDate = ""
 	end

 	sql = 
 		"SELECT u.id, COUNT(DISTINCT(owner.id)), COUNT(DISTINCT(creator.id)), COUNT(DISTINCT(subscriber.id)), COUNT(DISTINCT(comment.id)) " +
 		"FROM ( " +
 			"SELECT id FROM users " + 
 			(params[:user_lists].nil? ? "" : "WHERE #{params[:user_lists].collect{|u| "id=#{u} "}.join 'OR '}") +
 		") as u " +
		"LEFT JOIN (SELECT * FROM ideas #{theDate}) AS owner ON owner.owner_id = u.id " +
		"LEFT JOIN (SELECT * FROM ideas #{theDate}) AS creator ON creator.user_id = u.id " +
		"LEFT JOIN (SELECT * FROM commontator_comments #{theDate}) AS comment ON comment.creator_id = u.id " +
		"LEFT JOIN (SELECT * FROM subscriptions #{theDate}) AS subscriber ON subscriber.user_id = u.id " +	
		"GROUP BY u.id "
	@result = ActiveRecord::Base.connection.execute(sql).to_a
	@sql = sql
	@users = params[:user_lists]
	@date1 = params[:date_value1]
	@date2 = params[:date_value2]

 end

 def chart
 	if params[:chart_type] == "line"
 		if params[:date_type] == "day"
 			theDate = "DATE(created_at)"
 		elsif params[:date_type] == "month"
 			theDate = "CONCAT_WS('-',YEAR(created_at),MONTH(created_at))"
 		else
 			theDate = "YEAR(created_at)"
 		end
 		sql = 
 			"SELECT IFNULL(ac.count, 0), ad.d " + 
 			(params[:show_options3].nil? ? "" : ", ad.id ") +
 			"FROM ( " +
 				(params[:show_options3].nil? ? "" : 
 				"SELECT * FROM ( ") +
		 			"SELECT DISTINCT(#{theDate}) as d " +
		 			"FROM ( " +
					    "SELECT curdate() - INTERVAL (a.a + (10 * b.a) + (100 * c.a)) DAY as created_at " + 
					    "FROM (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as a " +
					    "CROSS JOIN (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as b " +
					    "CROSS JOIN (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as c " +
					") a " + 
					"WHERE a.created_at BETWEEN '#{params[:date_value1]}' AND '#{params[:date_value2]}' " + 
				(params[:show_options3].nil? ? "" : 
				") a CROSS JOIN ( " +
					"SELECT b.#{params[:show_options3].first} as id FROM (" +
						"SELECT " +
						(params[:show_options3].collect {|u| "#{u} "}.join "UNION SELECT ") +
					" )  b " +
				") c "
				) +

			") ad " +
			"LEFT JOIN (" +
	 			"SELECT COUNT(*) as count, #{theDate} as theDate " +
	 			(params[:show_options3].nil? ? "" : ", " + (params[:aggregate3] == "ideas" ? "user_id " : "creator_id ")) +
	 			"FROM #{params[:aggregate3]} " + 
	 			"WHERE #{params[:date_tag]} BETWEEN '#{params[:date_value1]}' AND '#{params[:date_value2]}' " +
	 			(params[:show_options3].nil? ? "" : "AND ( " + 
	 				(params[:aggregate3] == "ideas" ? 
	 					(params[:show_options3].collect {|u| "user_id = #{u} "}.join "OR ")
	 					: 
	 					(params[:show_options3].collect {|u| "creator_id = #{u} "}.join "OR ")
	 				) + ") "
	 			) +
	 			"GROUP BY theDate " + 
	 			(params[:show_options3].nil? ? "" : ", " + (params[:aggregate3] == "ideas" ? "user_id " : "creator_id ")) +
	 			"ORDER BY theDate " +
	 			(params[:show_options3].nil? ? "" : ", " + (params[:aggregate3] == "ideas" ? "user_id " : "creator_id ")) +
	 			"DESC " +
	 		") ac ON ad.d = ac.theDate " +
			(params[:show_options3].nil? ? "" : "AND ad.id = ac." + (params[:aggregate3] == "ideas" ? "user_id " : "creator_id ")) +
			"ORDER BY ad.d DESC"
 		@date_type=params[:date_type]
 	else
	 	sql = 
	 		"SELECT COUNT(*) as count, " +
	 		(
	 			params[:aggregate1].in?(Category.top_categories.collect{|u| u.to_s}) ? 
	 			"a1_category_id "
	 			:
	 			"#{params[:aggregate1]} "
	 		) +
	 		(
	 			params[:chart_type] != "bar" ? 
	 			"" 
	 			: 
	 			", " + 
	 			(
	 				params[:aggregate2].in?(Category.top_categories.collect{|u| u.to_s}) ? 
	 				"a2_category_id "
		 			:
		 			"#{params[:aggregate2]} "
	 			)
	 		) +
	 		"FROM ideas " +
	 		(
	 			params[:aggregate1].in?(Category.top_categories.collect{|u| u.to_s}) ? 
	 			(
	 				"INNER JOIN " +
	 				"(SELECT itag.idea_id as a1_idea_id, itag.category_id as a1_category_id " +
	 				"FROM idea_tags itag " + 
	 				"INNER JOIN categories ctag ON ctag.id = itag.category_id " + 
	 				"WHERE ctag.parent_id = #{Category.find_by_category_name(params[:aggregate1]).id}) as a1 " +
	 				"ON a1.a1_idea_id = ideas.id "
	 			)
	 			:
	 			""
	 		) +
	 		(
	 			(params[:chart_type] == "bar" and params[:aggregate2].in?(Category.top_categories.collect{|u| u.to_s})) ? 
	 			(
	 				"INNER JOIN " +
	 				"(SELECT itag.idea_id as a2_idea_id, itag.category_id as a2_category_id " +
	 				"FROM idea_tags itag " + 
	 				"INNER JOIN categories ctag ON ctag.id = itag.category_id " + 
	 				"WHERE ctag.parent_id = #{Category.find_by_category_name(params[:aggregate2]).id}) as a2 " +
	 				"ON a2.a2_idea_id = ideas.id "
	 			)
	 			:
	 			""
	 		) +
	 		"WHERE ideas.#{params[:date_tag]} BETWEEN '#{params[:date_value1]}' AND '#{params[:date_value2]}'   " +
	 		((params[:show_options1].nil? and (params[:chart_type] != "bar" or params[:show_options2].nil?)) ? "" : "AND ( ")

	 	if(params[:show_options1])
		 	params[:show_options1].each do |option|
		 		sql << " #{params[:aggregate1]} = #{option} OR"
		 	end
	 	end
	 	if(params[:show_options2])
		 	params[:show_options2].each do |option|
		 		sql << " #{params[:aggregate2]} = #{option} OR"
		 	end
		end
	 	if !(params[:show_options1].nil? and params[:show_options2].nil?)
	 		sql = sql[0..-3] + " ) "
	 	end
	 	sql << 
	 		"GROUP BY " +
	 		(
	 			params[:aggregate1].in?(Category.top_categories.collect{|u| u.to_s}) ? 
	 			"a1_category_id "
	 			:
	 			"#{params[:aggregate1]} "
	 		) +
			(
				params[:chart_type] != "bar" ? 
				"" : 
				", " +
				(
					params[:aggregate2].in?(Category.top_categories.collect{|u| u.to_s}) ? 
		 			"a2_category_id "
		 			:
		 			"#{params[:aggregate2]} "
				)

			) +
			"ORDER BY " +
	 		(
	 			params[:aggregate1].in?(Category.top_categories.collect{|u| u.to_s}) ? 
	 			"a1_category_id "
	 			:
	 			"#{params[:aggregate1]} "
	 		) +
	 		(
				params[:chart_type] != "bar" ? 
				"" : 
				", " +
				(
					params[:aggregate2].in?(Category.top_categories.collect{|u| u.to_s}) ? 
		 			"a2_category_id "
		 			:
		 			"#{params[:aggregate2]} "
				)

			) +
	 		"DESC"
	end

	@result = ActiveRecord::Base.connection.execute(sql).to_a
	@chart_type = params[:chart_type]
	@sql2 = sql

	if params[:aggregate1] == 'status_id'
		@label1 = Status.all
	elsif params[:aggregate1] == 'owner_id' or params[:aggregate1] == 'user_id'
		@label1 = User.all
	elsif params[:aggregate1] == 'provider_partner_id' or params[:aggregate1] == 'provider_partner_id'
		@label1 = Partner.all
	elsif params[:aggregate1].in?(Category.top_categories.collect{|u| u.to_s})
		@label1 = Category.get_children_by_parent_name params[:aggregate1]
	end

	if params[:aggregate2] == 'status_id'
		@label2 = Status.all
	elsif params[:aggregate2] == 'owner_id' or params[:aggregate2] == 'user_id'
		@label2 = User.all
	elsif params[:aggregate2] == 'provider_partner_id' or params[:aggregate2] == 'provider_partner_id'
		@label2 = Partner.all
	elsif params[:aggregate2].in?(Category.top_categories.collect{|u| u.to_s})
		@label2 = Category.get_children_by_parent_name params[:aggregate2]
	end
	@label3 = User.all
	@aggregate1 = params[:chart_type] != "line" ? params[:aggregate1] : params[:aggregate3]
	@aggregate2 = params[:chart_type] != "bar" ? nil : params[:aggregate2]

 end


 def pending_ideas
	
 end
 
 def pending_ideas_show
	@days = params[:submit]
	@ideas = Idea.where(:created_at => Time.now-(60*60*24*365*100)..Time.now - (60*60*24*@days.to_i))
	@all_status = Status.all
 end
 
 def status_show
   @ideas = Idea.where(status_id: params[:id])
   @status = Status.find(params[:id])
   @all_status = Status.all
 end
 
 
 def success_rate_show
	@ideas = Idea.where(user_id: params[:id])
	@user = User.find(params[:id])
	@all_status = Status.all
 end
 
 
 def popularity
	@categories = Category.top_categories
 end
 
 
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
	
 	private
 		def test_exist val
 			if !val.nil?
 				!val.empty?
 			else
 				false
 			end
 		end
end 

