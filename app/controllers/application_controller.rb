class ApplicationController < ActionController::Base
  # before_filter :set_time_zone, if: :user_signed_in?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    # request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    index_oauth_path
  end

  def logged_in_using_omniauth?
    session[:logged_in_using_omniauth].present?
  end
  helper_method :logged_in_using_omniauth?

  # private
  # def set_time_zone
  #   Time.zone = current_user.time_zone
  # end
end
