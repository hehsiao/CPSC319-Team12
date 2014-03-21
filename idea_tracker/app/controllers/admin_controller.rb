class AdminController < ApplicationController

	before_filter :authenticate_user!
	
	def index    
		@b=1
	end

	# GET /admin/edit
	def edit

	end

	# GET /admin/show
	def show
		@b=1
	end

	# GET /admin/show_setting
	def setting
		@categories = Category.where(parent_id: 0).to_a
	end


	
end
