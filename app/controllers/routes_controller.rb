class RoutesController < ApplicationController
  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)
    if @route.save
      flash[:success] = "Route Created!"
      redirect_to route_path(@route)
    else #Will be invalid until all other attributes are created. Drop down menu!
      flash[:error] = "Invalid Route!"
      render :new
    end
  end

  private

  def route_params
    params.require(:route).permit(:route_name, :description)
  end
end
