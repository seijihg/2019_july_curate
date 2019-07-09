class SessionsController < ApplicationController
  def new
    @user =  User.new
  end
  def create
    user = User.find_by(user_name: params[:user][:user_name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to index_path, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to index_path, notice: "Logged out!"
  end
end
