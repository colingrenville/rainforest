class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

def pagetitle
  @pagetitle = "Default Page Title"
end

def current_user
  	if session[:user_id]
  		return @current_user = User.find_by_id(session[:user_id])
  	else 
  		return nil
  	end
end

  private
  
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
