class AdminController < ApplicationController

	before_filter :check_admin_permission
	
	def index    
	end

	# GET /admin/edit
	def edit

	end

	# GET /admin/show
	def show
	end

	# GET /admin/show_setting
	def setting
		@categories = Category.top_categories
	end


	
end
