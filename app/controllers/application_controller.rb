class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?

def configure_devise_parameters
  devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :is_alive, :email, :password, :password_confirmation, :description)}
  devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :is_alive, :email, :password, :password_confirmation, :current_password, :description)}
end

end
