class TapstersController < ApplicationController
  def show
    @tapster = Tapster.find_by_identifier!(params[:id])
  end
  def create
    if logged_in?
      current_user.tapsters.create!(params[:tapster])
    else
      @tapster.Tapster.new(params[:tapster])
    end
  rescue ActiveRecord::RecordInvalid => e
    resp = {
      :errors => e.record.errors.to_a,
      :status => 403
    }
    p resp
    render :json => resp
  end
end
