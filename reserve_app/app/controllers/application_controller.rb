class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def take_params
    {:id     => params[:id]}
  end

  helper_method :take_params
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :user_icon, :introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :user_icon, :introduction])
  end
end
