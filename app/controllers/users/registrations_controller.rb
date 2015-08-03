class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters
  
  protected

  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :surname, :nickname, :email, :slogan, :password, :password_confirmation,:avatar )
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name,:surname, :nickname,:slogan, :email, :password, :password_confirmation, :current_password,:avatar,:role)
    end
  end
  
end