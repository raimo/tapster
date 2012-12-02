class RequestsController < ApplicationController
  def index
    @requests = Request.order('created_at desc')
  end
  def show
    @request = Request.find(params[:id])
    render :partial => 'show'
  end
end
