class ApplicationController < ActionController::Base

  protect_from_forgery
  helper_method :logged_in?, :current_user
  before_filter :path_format, :find_tapsters
  protected

  def path_format
    params[:path] = "/#{params[:path]}"
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
    @current_user
  end

  def logged_in?
    !!current_user
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

  def respond(code, values)
    values['status'] = code
    p values
    render :json => values, :status => code
  end

  def find_tapsters
    @tapsters = Tapster.all
  end

end
