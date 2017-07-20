class RoutesController < ApplicationController
  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)
    if @route.save
      flash[:success] = "Route Created!"
      redirect_to route_path(@route)
    else
      byebug
      flash[:error] = "Invalid Route!"
      render :new
    end
  end

  def show
    @route = Route.find(params[:id])
  end

  private

  def route_params
    params.require(:route).permit(:route_name, :description, :location_id, :pitch_id, :rating_id)
  end
end
