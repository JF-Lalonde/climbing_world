class RoutesController < ApplicationController
  def new
    @route = Route.new
  end

  def index
    @routes = Route.all
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

  def edit
    @route = Route.find(params[:id])
  end

  def update
    @route = Route.find(params[:id])
    @route.update(route_params)
    if @route.save
      flash[:success] = "Route Updated!"
      redirect_to route_path(@route)
    else
      flash[:error] = "Invalid Update!"
      render :edit
    end
  end

  def destroy
    route = Route.find(params[:id])
    route.destroy
    flash[:success] = "Route Removed"

    redirect_to routes_path
  end

  private

  def route_params
    params.require(:route).permit(:route_name, :description, :location_id, :pitch_id, :rating_id)
  end
end