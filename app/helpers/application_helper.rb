module ApplicationHelper

    def logged_in?
        if !!session[:user_id]
            redirect_to root
        end
    end
end
