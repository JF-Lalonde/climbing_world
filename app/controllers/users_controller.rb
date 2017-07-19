class UsersController < ApplicationController
  def new
    @user = User.new
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
    flash[:success] = "User deleted!"
    redirect_to "welcome#index"
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
