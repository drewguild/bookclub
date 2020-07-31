class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :login]

  def login
    if current_user
      redirect_to overview_url
    end

    render layout: "landing"
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to overview_url
    else
      flash.now[:alert] = "Email or password invalid"
      render "login"
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_url
  end
end