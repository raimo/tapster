class DashboardController < ApplicationController
  def index
    @tapsters = current_user.try(:tapsters)
    @tapster = Tapster.new
  end
end
