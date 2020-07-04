class SessionsController < ApplicationController

    def home
    end

    def logged_in
        byebug
        user = User.find_or_create_by(uid: request.env['omniauth.auth'].uid.to_i)
        user.name = request.env['omniauth.auth'].info.name
        user.email = request.env['omniauth.auth'].info.email
        user.password = SecureRandom.hex
        redirect_to user_path(user)
    end
end
