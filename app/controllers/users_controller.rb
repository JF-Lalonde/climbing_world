class UsersController < ApplicationController
  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Login Successful!"
      redirect_to "/users/#{@user.id}"
    else
      redirect_to "user#new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
