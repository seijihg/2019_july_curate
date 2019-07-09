class UsersController < ApplicationController
    before_action :require_login
    #skip_before_action :require_login, only: [:index]

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
    end


    private

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :user_name, :password, :password_confirmation)
    end
end
