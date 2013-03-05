class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate_user!, :except => [:some_action_without_auth]
  
  # Handle CanCan::AccessDenied Exception
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
  
  # Access Current User
  def index
      @things = current_user.things
  end
end
