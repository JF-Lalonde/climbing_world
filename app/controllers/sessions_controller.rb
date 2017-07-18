class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Login Successful"
      redirect_to root_path
    else
      flash[:notice] = "Invalid Login!"
      redirect_to "sessions#new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully Logged Out!"
    redirect_to root_path
  end
end
