class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    order_direction = params[:sort] == 'name' && session[:sort_direction] == 'asc' ? 'desc' : 'asc'
    session[:sort_direction] = order_direction
    @foods = @user.foods.order("LOWER(name) #{order_direction}")
  end
  
  

  def show; end

  def new
    @food = Food.new
  end

  def destroy
    @food = current_user.foods.find(params[:id])
    if @food.destroy
      redirect_to foods_path, notice: 'Food was successfully destroyed.'
    else
      redirect_to foods_path, alert: 'Failed to destroy food.'
    end
  end

  def create
    @food = current_user.foods.build(food_params)

    if @food.save
      redirect_to foods_path, notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :quantity, :measurement_unit, :price)
  end
end
