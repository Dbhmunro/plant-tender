class UsersController < ApplicationController

    def show
        @user = User.find_by(id: params[:user_id])
    end

    def new
    end
end