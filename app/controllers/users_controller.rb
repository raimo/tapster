class UsersController < ApplicationController
  def show
    @user = current_user
    @friends = @user.friendships.order('length(tags) desc').limit(10)
  end
end
