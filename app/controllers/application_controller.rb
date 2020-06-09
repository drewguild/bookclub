class ApplicationController < ActionController::Base
  before_action :require_login
  protect_from_forgery with: :exception

  def current_club
    current_member && current_member.club
  end

  def current_user
    return unless session[:user_id]
    
    @current_user = User.find(session[:user_id])
  end

  def current_member
    @current_member = current_user.member
  end

  private

  def require_login
    unless current_user
      redirect_to root_url
    end
  end
end
