class UsersController < ApplicationController
  def show
    @user = current_user
    @friends = @user.friendships.order('updated_at desc').limit(10)
  end
end
