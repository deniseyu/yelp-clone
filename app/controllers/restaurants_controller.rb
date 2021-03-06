class RestaurantsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @restaurants = Restaurant.all.reverse
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @user = User.find(current_user)
    @restaurant = @user.restaurants.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :image)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    flash[:notice] = 'Restaurant successfully edited'
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params[:restaurant].permit(:name, :description, :image))
    redirect_to restaurants_path
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice] = 'Restaurant deleted successfully'
    redirect_to restaurants_path
  end

end
