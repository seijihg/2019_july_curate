class SessionsController < ApplicationController


  def new

  end

  def create
    user = User.find_by(user_name: params[:session][:user_name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', notice: "Logged out!"
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
