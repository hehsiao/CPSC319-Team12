class IdeasController < ApplicationController
	before_action :check_user_permission
	before_action :set_idea, only: [:show, :edit, :update, :destroy]
	# GET /ideas
	# GET /ideas.json
	def index
		if params[:keyword]
			@ideas = Idea.tagged_with(params[:keyword])
		else
			@ideas = Idea.all
		end
		# @user = User.find(params[:user_id])
		# @ideas = @user.ideas
		@e_ideas = []
        @e_ideas << Idea.find_by_id('2')

    @recent_ideas = Idea.order("created_at desc").limit(5)
		@my_ideas = Idea.where(user_id: current_user.id)
		@subscribed_ideas = Idea.joins(:participants).where("subscriptions.user_id = ?", 1)
		@sub_ideas = Subscription.where(user_id: current_user.id)  
        
     
		#respond_to do |format|
        #format.html 
        #format.csv{ send_data to_csv(@e_ideas).encode('ISO-8859-1', {:invalid => :replace, :undef => :replace, :replace => ''})}
        #end

	end

    def to_csv_all

    	    puts "-------------------------------------"+params[:e_idea].inspect+"----------------------------------------"
        
        	@export_ids = params[:e_idea]
		    @export_ideas = []
      
            @export_ids.each do |export_id|
              @export_ideas << Idea.find_by_id(export_id)
            end 

		header = ["summary", "description"]
	    file = CSV.generate do |csv|
	    	csv << header
			@export_ideas.each do |export_idea|
				csv << [export_idea.summary,export_idea.description]
			end
		end
		send_data(file.encode('ISO-8859-1', {:invalid => :replace, :undef => :replace, :replace => ''}), :type => 'text/csv', :filename => 'ideas.csv')  
	end

	def to_csv
		  @idea = Idea.find(params[:id])

    	    puts "-------------------------------------"+params[:id].inspect+"----------------------------------------"
        
		header = ["summary", "description"]
	    file = CSV.generate do |csv|
	    	csv << header
			csv << [@idea.summary, @idea.description]
		end
		send_data(file.encode('ISO-8859-1', {:invalid => :replace, :undef => :replace, :replace => ''}), :type => 'text/csv', :filename => 'idea.csv')  
	end

	# GET /ideas/1
	# GET /ideas/1.json
	def show

		@status = @idea.status
		@categories = Category.top_categories
		user_list
		commontator_thread_show(@idea) 
		if @idea.provider_partner_id != nil
			@provider = Partner.find(@idea.provider_partner_id).partner_name
		else 
			@provider = "None Assigned"
		end
		if @idea.receiver_partner_id != nil
			@receiver = Partner.find(@idea.receiver_partner_id).partner_name
		else 
			@receiver = "None Assigned"
		end
 
	end

	# GET /ideas/new
	def new
		@idea = Idea.new
		if(params[:provider_use] == "provider_partner_form")
			@partner = Partner.new(params[partner_params])
			@partner.save
			@idea.provider_partner_id = @partner.id
		end
		if(params[:receiver_use] == "receiver_partner_form")
			@partner = Partner.new(params[partner_params])
			@partner.save
			@idea.receiver_partner_id = @partner.id
		end
		@categories = Category.top_categories
		user_list
		keyword_list
		idea_list

		if(params[:parent_idea_id])
			@parent_idea_id = params[:parent_idea_id]
		end
		if(params[:peer_idea_ids])
			@peer_idea_ids = params[:peer_idea_ids]
		end
	end

	# GET /ideas/1/edit
	def edit
		@categories = Category.top_categories
  	user_list
  	keyword_list
  	idea_list
	end

	# POST /ideas
	# POST /ideas.json
	def create

		@idea = Idea.new(idea_params)
		if(params[:provider_use] == "provider_partner_form")
			@partner = Partner.new(params[partner_params])
			@partner.save
			@idea.provider_partner_id = @partner.id
		end
		if(params[:receiver_use] == "receiver_partner_form")
			@partner = Partner.new(params[partner_params])
			@partner.save
			@idea.receiver_partner_id = @partner.id
		end
  	user_list	
		idea_list    	
		@idea.owner_id = Setting.default_owner
		@idea.user_id = current_user.id
		@idea.status_date_change = Time.now

#    @idea.provider_partner_id = params[:provider_partner_id]
		respond_to do |format|
			if @idea.save
				params[:id] = @idea.id
				handle_category_tags
				handle_associations
        handle_participations 
        keyword_list 
				format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
				format.json { render action: 'show', status: :created, location: @idea }
			else
				format.html { render action: 'new' }
				format.json { render json: @idea.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /ideas/1
	# PATCH/PUT /ideas/1.json
	def update
		@last_update = @idea.updated_at
		if !(@idea.status_id.to_s == idea_params[:status_id])
			@idea.status_date_change = Time.now
		end
		respond_to do |format|
			if @idea.update(idea_params)

				params[:id] = @idea.id
				handle_partners
				# Category Tags
				handle_category_tags
				handle_associations
				handle_participations
				keyword_list
				idea_list
				# Email Notification
				# if @last_update - 5.minute.ago < 0  
				UserMailer.edit_notification_email(@idea, current_user).deliver
				# end
				
				format.html { redirect_to @idea, notice: "Idea was successfully updated."}
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @idea.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /ideas/1
	# DELETE /ideas/1.json
	def destroy
		IdeaTag.connection.execute("delete from idea_tags where idea_id = #{params[:id]}")
		@idea.destroy
		respond_to do |format|
			format.html { redirect_to ideas_url }
			format.json { head :no_content }
		end
	end

   def sendemail

      @user = current_user
      @idea = Idea.find(params[:id])
     
      puts "to this email" + " " + params[:send_mail].inspect

      UserMailer.idea_email(@idea, params[:send_mail]).deliver

      
      respond_to do |format|
      if params[:send_mail].present?
        format.html { redirect_to @idea, notice: 'Idea was successfully send.' }
        format.json { render action: 'show', status: :created, location: @idea }
      else
        format.html { redirect_to @idea, notice: 'require to enter email address' }
        format.json { render action: 'show', status: :created, location: @idea }
        end
      end
  end

	private
	def idea_list
      @idea_selections = "["
      Idea.all.each do |u|
      	if params[:id] != u.id.to_s
        	@idea_selections += "{id: '" + u.id.to_s + "', summary: '" + u.summary + "'}, "
        end
      end
      @idea_selections = @idea_selections[0...-2]
      @idea_selections += "]"
    end

    def user_list
      @participants = "["
      User.all.each do |u|
        @participants += "{email: '" + u.email + "', name: '" + u.first_name + " " + u.last_name + "'}, "
      end
      @participants = @participants[0...-2]
      @participants += "]"
    end

    def keyword_list
      @keywords = "["
      Tag.all.each do |t|
        @keywords += "{name: '" + t.name + "'}, "
      end
      @keywords = @keywords[0...-2]
      @keywords += "]"
    end
	    
	  def handle_partners
	  	@provider = Partner.create(:partner_name => params[:provider_partner][:partner_name],
						:contact_name => params[:provider_partner][:contact_name],
						:email => params[:provider_partner][:email],
						:phone_num => params[:provider_partner][:phone_num],
						:secondary_contact_name => params[:provider_partner][:secondary_contact_name],
						:secondary_email => params[:provider_partner][:secondary_email],
						:secondary_phone_num => params[:provider_partner][:secondary_phone_num])
	  	if @provider.save && params[:provider_use] == "provider_partner_form"
	  		@idea.provider_partner_id = @provider.id
	  		@idea.save
	  	end

	  	@receiver = Partner.create(:partner_name => params[:receiver_partner][:partner_name],
						:contact_name => params[:receiver_partner][:contact_name],
						:email => params[:receiver_partner][:email],
						:phone_num => params[:receiver_partner][:phone_num],
						:secondary_contact_name => params[:receiver_partner][:secondary_contact_name],
						:secondary_email => params[:receiver_partner][:secondary_email],
						:secondary_phone_num => params[:receiver_partner][:secondary_phone_num])
	  	if @receiver.save && params[:receiver_use] == "receiver_partner_form"
	  		@idea.receiver_partner_id = @receiver.id
	  		@idea.save
	  	end

	  end

		def handle_participations
			if !params[:idea][:participants].nil?
				Subscription.where(:idea_id => params[:id]).destroy_all
				participants = params[:idea][:participants].split ','
				participants.each do |p|
					Subscription.create(:idea_id => params[:id], :user_id => User.where(:email => p).first.id, :is_active => 1)
				end
			end
		end

		def handle_associations
			if !params[:idea][:association_peers].nil?
				Association.connection.execute("delete from associations where parent_idea_id=#{params[:id]} OR tagged_idea_id=#{params[:id]} ")
				peer_associations = params[:idea][:association_peers].split ','
				peer_associations.each do |p|
					Association.create(:parent_idea_id => params[:id], :tagged_idea_id => p, :is_hierarchy => 0)
					Association.create(:parent_idea_id => p, :tagged_idea_id => params[:id], :is_hierarchy => 0)
				end
			end
			if !params[:idea][:association_parents].nil?
				peer_associations = params[:idea][:association_parents].split ','
				peer_associations.each do |p|
					Association.create(:parent_idea_id => p, :tagged_idea_id => params[:id], :is_hierarchy => 1)
				end
			end
			if !params[:idea][:association_childs].nil?
				peer_associations = params[:idea][:association_childs].split ','
				peer_associations.each do |p|
					Association.create(:parent_idea_id => params[:id], :tagged_idea_id => p, :is_hierarchy => 1)
				end
			end
		end


		def handle_category_tags
			if !params[:cat_tag].nil?
				IdeaTag.connection.execute("delete from idea_tags where idea_id = #{params[:id]}")
				cat_tags = params[:cat_tag]
				cat_tag_data = params[:cat_tag_data]
				if cat_tags 
					cat_tags.each do |tag|
						if cat_tag_data and cat_tag_data.has_key?(tag)
							IdeaTag.create(:idea_id => params[:id], :category_id => tag, :additional_text => cat_tag_data[tag])
						else
							IdeaTag.create(:idea_id => params[:id], :category_id => tag)
						end
					end
				end
			end
		end

		# Use callbacks to share common setup or constraints between actions.
		def set_idea
			@idea = Idea.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def idea_params
			params.require(:idea).permit(:user_id, :summary, :description, :provider_partner_id, :receiver_partner_id, :keyword_list, :submission_date, :last_modified, :status_date_change, :status_id)

		end

		def partner_params  
			params.require(:provider_partner).permit(:provider_partner => [:secondary_phone_num, :partner_name, :contact_name, :email, :phone_num, :secondary_contact_name, :secondary_email])
			# params.require(:status).permit(:id)
			params.require(:receiver_partner).permit(:receiver_partner => [:secondary_phone_num, :partner_name, :contact_name, :email, :phone_num, :secondary_contact_name, :secondary_email])

		end
	end

