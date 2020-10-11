class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [ :nickname, :email, :password, :birthday, :family_name, :first_name ,:family_name_kana ,:first_name_kana, :image, :introdaction]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
    root_path
  end
end
