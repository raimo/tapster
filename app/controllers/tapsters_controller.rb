class TapstersController < ApplicationController
  def show
    @tapster = Tapster.find_by_identifier!(params[:id])
  end
end
