class UsersController < ApplicationController

    def show
        @user = User.find_by(id: params[:id])
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
            render :new
        end
    end

    def edit
        @user = User.find_by(id: params[:user_id])
        if session[:user_id] != @user.id
            @user = User.find_by(id: session[:user_id])
            redirect_to edit_user_path(@user)
        end
    end
    
    def update
        @user = User.find_by(id: params[:user_id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end
    
    def destroy
        @user = User.find_by(id: params[:user_id])
        @user.destroy
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :zipcode)
    end
end