class ApplicationController < ActionController::Base

  protect_from_forgery
  before_filter :path_format
  helper_method :logged_in?
  protected

  def path_format
    params[:path] = "/#{params[:path]}"
  end

  def current_user
    @current_user ||= User.find_by_facebook_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def login_required
    unless logged_in?
      flash[:error] = "You must first log in or sign up before accessing this page."
      store_target_location
      redirect_to login_url
    end
  end

  def redirect_to_target_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  private

  def store_target_location
    session[:return_to] = request.fullpath
  end
end
