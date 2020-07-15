class UsersController < ApplicationController
    before_action :require_login, only: [:show, :edit]

    def show
        current_user
        @fav_plants = @user.fav_plants
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            # byebug
            render new_user_path
        end
    end

    def edit
        if current_user.id != params[:id].to_i
            redirect_to edit_user_path(@user)
        end
    end
    
    def update
        if current_user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end
    
    def destroy
        current_user.destroy
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :zipcode)
    end
end