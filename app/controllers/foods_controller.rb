class FoodsController < ApplicationController
  load_and_authorize_resource
  before_action :set_food, only: %i[show destroy]

  def index
    if user_signed_in?
      @food = Food.includes(:user).where(user_id: current_user.id)
    else
      redirect_to user_session_path
    end
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.build(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_url, notice: 'Food was successfully created.' }
      else
        format.html { render :new, alert: 'Food could not be created' }
      end
    end
  end

  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
    end
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :quantity, :price)
  end
end
