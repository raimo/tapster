class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    p auth
    if auth 
      user = User.where(:facebook_id => auth.uid).first_or_initialize.tap do |user|
        user.facebook_id = auth.uid
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
      end
      session[:user_id] = user.id
    end
    redirect_to params[:return] || session[:return] || root_url
  end
end
