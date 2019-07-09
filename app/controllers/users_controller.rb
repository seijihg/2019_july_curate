class UsersController < ApplicationController

    def show
      @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            redirect_to index_path
        else
            flash[:errors] = user.errors.full_messages
            redirect_to  signup_path
        end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
        if @user.update_attributes(user_params)
          @user.update(user_params)
          redirect_to user_path
        else
          render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :user_name, :password, :password_confirmation)
    end


end
