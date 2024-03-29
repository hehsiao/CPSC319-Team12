class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Check if user is logged in, determine the layouts, and redirect to login page
  layout :determine_layout

  before_action :check_user_permission 
  before_action :configure_permitted_parameters, if: :devise_controller?

  def check_admin_permission
    if !current_user.try(:admin?)
      flash[:error] = "Unauthorized!"
      redirect_to '/dashboard'
    end
  end

  def check_user_permission
    authenticate_user!
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :first_name, :last_name, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :first_name, :last_name, :password, :password_confirmation, :current_password) }
  end

  # Determine layout for Sign In Front, or Application view
  private
  def determine_layout
    signed_in? ? "application" : "sign_in"
  end
end
