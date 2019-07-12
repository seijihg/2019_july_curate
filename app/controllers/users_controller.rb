class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

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

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "Profile successfuly updated"
            redirect_to @user
        else
            flash[:errors] = @user.errors.full_messages
            render "edit"
        end
    end


    private

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :user_name, :password, :password_confirmation)
    end
end
