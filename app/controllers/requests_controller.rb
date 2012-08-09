class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end
  def show
    @request = Request.find(params[:id])
    render :partial => 'show'
  end
end
