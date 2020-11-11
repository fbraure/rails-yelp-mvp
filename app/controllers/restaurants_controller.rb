class RestaurantsController < ApplicationController
  before_action :get_instance_from_id, only: [:show, :edit]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @reviews = Review.where(:restaurant_id == @restaurant.id)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(required_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def edit
  end

  private

  def get_instance_from_id
    @restaurant = Restaurant.find(params[:id])
  end

  def required_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
