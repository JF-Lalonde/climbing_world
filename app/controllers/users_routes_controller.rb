class UsersRoutesController < ApplicationController
  def new
    @users_route = UsersRoute.new
  end

  def index
    @users_routes = UsersRoute.all
  end

  def create
    @users_route = UsersRoute.new(users_route_params)
    if @users_route.save
      flash[:success] = "UsersRoute Created!"
      redirect_to users_route_path(@users_route)
    else
      byebug
      flash[:error] = "Invalid UsersRoute!"
      render :new
    end
  end

  def show
    @users_route = UsersRoute.find(params[:id])
  end

  def edit
    @users_route = UsersRoute.find(params[:id])
  end

  def update
    @users_route = UsersRoute.find(params[:id])
    @users_route.update(users_route_params)
    if @users_route.save
      flash[:success] = "UsersRoute Updated!"
      redirect_to users_route_path(@users_route)
    else
      flash[:error] = "Invalid Update!"
      render :edit
    end
  end

  def destroy
    users_route = Route.find(params[:id])
    users_route.destroy
    flash[:success] = "Route Removed"

    redirect_to users_routes_path
  end

  private

  def users_route_params
    params.require(:users_route).permit(:user_id, :route_id)
  end
end
