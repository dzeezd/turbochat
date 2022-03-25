class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:pfp])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[pfp room_id])
  end
end
