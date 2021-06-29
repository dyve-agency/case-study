class DashboardController < ApplicationController
  def index
    @meals = current_user.meals
    respond_to :html
  end
end
