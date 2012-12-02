class TapstersController < ApplicationController
  def show
    @tapster = Tapster.find_by_identifier!(params[:id])
  end
  def create
    @tapster.create
  end
end
