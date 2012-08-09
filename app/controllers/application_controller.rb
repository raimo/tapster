class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :path_format

  def path_format
    params[:path] = "/#{params[:path]}"
  end
end
