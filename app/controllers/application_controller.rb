class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # http://guides.rubyonrails.org/security.html#cross-site-request-forgery-csrf
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def reject_user
    redirect_to root_path, alert: 'You are not authorized!'
  end
end
