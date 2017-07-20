class RatingsController < ApplicationController
  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      flash[:success] = "Rating Created!"
      redirect_to rating_path(@rating)
    else
      flash[:error] = "Invalid Rating!"
      render :new
    end
  end

  def show
    @rating = Rating.find(params[:id])
  end

  private

  def rating_params
    params.require(:rating).permit(:number)
  end
end
