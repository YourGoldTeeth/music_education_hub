class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :alert_check
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :age, :password_confirmation, :role, :instrument_id)
  end

  # def alert_check
  #   if current_user.role_id == 4
  #     @alert_check = Homework.last.id
  #   else  
  #     @alert_check = Assignment.where(user_id: current_user.id).last.id
  #   end
  # end  

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :email, :password, :age, :password_confirmation, :instrument_id, :role])
   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :email, :password, :age, :password_confirmation, :instrument_id, :role])
  end
end


# def configure_permitted_parameters
  # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
# end