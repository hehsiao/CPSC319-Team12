class HomeController < ApplicationController

def index
	if current_user.try(:admin?)
 		redirect_to :controller=>'admin', :action => 'index'
  	elsif user_signed_in?
    	redirect_to :controller=>'dashboard', :action => 'index'
 	end
end

end
