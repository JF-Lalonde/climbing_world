class UsersController < ApplicationController
  before_action :authorize_admin, only: :index
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Login Successful!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    session[:user_id] = user.id
    session.delete(:user_id)
    flash[:success] = "User Deleted!"
    redirect_to users_path
    #Delete session not working
    #Create an if else for different redirects based on admin or default
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def authorize_admin
    render file: "public/404", status: 404, formats: [:html] unless current_user && current_user.admin?
  end
end
