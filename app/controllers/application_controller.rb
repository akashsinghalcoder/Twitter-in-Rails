class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception. - 
  # For APIs, you may want to use :null_session instead.
    helper_method :current_user
  protect_from_forgery with: :exception
  private def user_signed_in?
  	!session[:user_id].nil?
  end
  def authenticate_user
  	if user_signed_in?
   	else
  		return redirect_to '/signin'
  	end
  end


  def current_user
  	if user_signed_in? 
  		return User.find(session[:user_id])

  	end
  end
end
