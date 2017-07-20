class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = "location Created!"
      redirect_to location_path(@location)
    else
      flash[:error] = "Invalid location!"
      render :new
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  private

  def location_params
    params.require(:location).permit(:region, :city, :state)
  end
end
