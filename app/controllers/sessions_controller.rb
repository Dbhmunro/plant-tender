class SessionsController < ApplicationController

    def home
    end

    def g_log_in
        # byebug
        user = User.find_or_initialize_by(uid: omni_req.uid)
        user.update(name: omni_req.info.name, email: omni_req.info.email, password: SecureRandom.hex, oauth: true)
        session[:user_id] = user.id
        redirect_to user_path(user)
    end

    def new
        @user = User.new
    end

    def create
        # byebug
        @user = User.find_by(email: params[:user][:email])
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_session_path
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

    private

    def omni_req
        request.env['omniauth.auth']
    end
end
