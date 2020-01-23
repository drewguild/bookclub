class ApplicationController < ActionController::Base
  before_action :require_login
  protect_from_forgery with: :exception

  def current_user
    return unless session[:user_id]
    
    User.find(session[:user_id])
  end

  private

  def require_login
    unless current_user
      redirect_to root_url
    end
  end
end
