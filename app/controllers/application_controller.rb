class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :is_user_permitted?, :require_admin

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def is_user_permitted?(user = nil)
    logged_in? && (user == current_user || current_user.admin?)
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

  def require_admin
    if !logged_in? || (logged_in? && !current_user.admin?)
      flash[:alert] = "Only admins can perform that action"
      redirect_to categories_path
    end
  end
end
