class DashboardController < ApplicationController
  def index
    @meals = current_user.meals.order(:meal_type).group_by { _1.created_at.to_date }
    respond_to :html
  end
end
