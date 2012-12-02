class VotesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create

  def create
    user = User.find_by_login_token!(params[:login_token])
    tapster = Tapster.find_by_identifier!(params[:tapster_identifier])
    option = Option.where(:tapster_id => tapster.id, :id => params[:option_id]).first
    vote = option.votes.where(:option_id => option.id).first_or_initialize.tap do |vote|
      vote.option_id = params[:option_id]
      vote.user_id = user.id
      vote.save!
    end
    render :json => { :vote => vote.to_json, :options => tapster.options.map{|o| {:id => o.id, :count => o.vote_count} }}
  end
end
