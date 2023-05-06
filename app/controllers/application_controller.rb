class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if current_user
      categories_path
    else
      splash_index_path # or some other path that makes sense
    end
  end
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password,
               :current_password)
    end
  end

  def after_sign_out_path_for(_resource_or_scope)
    unauthenticated_root_path
  end
end
