class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Allow profile pic to be permitted
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :pic])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :pic])
  end


end
