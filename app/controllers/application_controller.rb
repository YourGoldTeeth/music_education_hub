class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :age, :password_confirmation, :role)
  end

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :role])
   devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :role])
  end
end


# def configure_permitted_parameters
  # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
# end