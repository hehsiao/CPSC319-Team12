class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Check if user is logged in, determine the layouts, and redirect to login page
  layout :determine_layout
  before_filter :authenticate_user! 

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :first_name, :last_name, :password, :password_confirmation) }
  end

  # Determine layout for Sign In Front, or Application view
  private
    def determine_layout
      signed_in? ? "application" : "sign_in"
    end
end
