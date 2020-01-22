class SessionsController < ApplicationController
    def login
        if current_user
            redirect_to nominations_url
        end
    end

    def create
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to nominations_url
        else
            flash.now[:alert] = "Email or password invalid"
            render "login"
        end
    end
end