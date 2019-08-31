class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  protect_from_forgery with: :exception
  helper_method :current_user

  def require_logged_in
    redirect_to '/login' unless current_user
  end

  # def current_user
  #   @current_user ||= User.find_by_id(session[:user_id])
  # end

  def logged_in?
    session[:user_id]
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


end
