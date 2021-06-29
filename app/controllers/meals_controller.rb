class MealsController < ApplicationController
  respond_to :html

  def new
    @meal = current_user.meals.new
    respond_with @meal
  end

  def create
    @meal = current_user.meals.new(meal_params)

    if @meal.save
      flash[:notice] = "New meal entry was added."
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @meal = current_user.meals.find(params[:id])
  end

  def update
    @meal = current_user.meals.find(params[:id])

    if @meal.update(meal_params)
      flash[:notice] = "#{@meal.meal_type} has been edited successfully."
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    @meal = current_user.meals.find(params[:id])
    @meal.destroy

    flash[:notice] = "#{@meal.meal_type} has been deleted."
    redirect_to root_url
  end

  private

  def meal_params
    params.require(:meal).permit(:meal_type, :fats, :proteins, :calories, :carbohydrates)
  end
end
