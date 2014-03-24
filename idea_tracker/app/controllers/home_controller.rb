class HomeController < ApplicationController
	before_action :check_user_permission

	def index
		if current_user.try(:admin?)
			redirect_to :controller=>'admin', :action => 'index'
		else
			redirect_to :controller=>'dashboard', :action => 'index'
		end
	end
end
