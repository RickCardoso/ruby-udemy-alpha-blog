class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :is_current_user?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def is_current_user?(user)
    logged_in? && user == current_user
  end
end
