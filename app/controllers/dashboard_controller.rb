class DashboardController < ApplicationController
  def index
    @tapster = Tapster.new
  end
end
