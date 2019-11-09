class SessionsController < ApplicationController


  def new

  end

  def create
    user = User.find_by(user_name: params[:user_name])
    if user && user.authenticate(params[:password])
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

  private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
