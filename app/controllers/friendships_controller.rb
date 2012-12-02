class FriendshipsController < ApplicationController
  def update
    @friendship = current_user.friendships.find(params[:id]).update_attribute(:tags, params[:friendship][:tags])
    render :json => { :friendship => @friendship.to_json }
  end
end
