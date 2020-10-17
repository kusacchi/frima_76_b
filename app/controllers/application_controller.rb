class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  protected


  def configure_permitted_parameters
    added_attrs = [ :nickname, :email, :password, :birthday, :family_name, :first_name ,:family_name_kana ,:first_name_kana, :image, :introdaction]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  
end
