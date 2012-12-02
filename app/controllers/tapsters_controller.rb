class TapstersController < ApplicationController
  def index
    if logged_in?
      @tapster = Tapster.new
    else
      @tapster = []
    end
  end
  def show
    @tapster = Tapster.find_by_identifier!(params[:id])
  end
  def create
    @tapster = if logged_in?
                 current_user.tapsters.create!(params[:tapster])
               else
                 Tapster.new(params[:tapster])
               end
    respond(201, :tapster => @tapster, :location => tapster_url(@tapster))
  rescue ActiveRecord::RecordInvalid => e
    respond(403, :errors => e.record.errors.to_a)
  end
end
