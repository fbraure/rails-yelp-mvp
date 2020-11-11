class ReviewsController < ApplicationController
  before_action :get_instance_from_id, only: [:show, :edit]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(required_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def get_instance_from_id
    @review = Review.find(params[:id])
  end

  def required_params
    params.require(:review).permit(:rating, :content)
  end
end
