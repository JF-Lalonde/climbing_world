class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def index
    @locations = Location.all
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

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    @location.update(location_params)
    if @location.save
      flash[:success] = "Location Updated!"
      redirect_to location_path(@location)
    else
      flash[:error] = "Invalid Update!"
      render :edit
    end
  end

  def destroy
    location = Location.find(params[:id])
    location.destroy
    flash[:success] = "Location Removed"

    redirect_to locations_path
  end

  private

  def location_params
    params.require(:location).permit(:region, :city, :state)
  end
end
